import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulknobe_customer/Core/Constants/firebase_constants/firebase_Constants.dart';
import 'package:soulknobe_customer/Core/common/failure.dart';
import 'package:soulknobe_customer/Core/common/type_defs.dart';
import 'package:soulknobe_customer/Core/firebase_Providers/firebase_Provider.dart';
import 'package:soulknobe_customer/Model/UserModel.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(
      googleSignIn: ref.watch(googleprovider),
      firestore: ref.watch(firestoreProvider),
      auth: ref.watch(authprovider));
});

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository(
      {required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googleSignIn})
      : _firestore = firestore,
        _googleSignIn = googleSignIn,
        _auth = auth;

  final authstate = FirebaseAuth.instance;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  FutureEither signInWithGoogle(
    BuildContext context,
  ) async {
    try {
      UserCredential userCredential;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      userCredential = await _auth.signInWithCredential(credential);
      print("userCredential: $userCredential");

      final uid = userCredential.user!.uid;
      final userSnapshot = await _users
          .where('email', isEqualTo: userCredential.user!.email)
          .get();
      UserModel? userModel;
      if (userSnapshot.docs.isNotEmpty) {
        userModel = UserModel.fromJson(
            userSnapshot.docs[0].data() as Map<String, dynamic>);
        return right(userModel);
      } else {
        userModel = UserModel(
            id: userCredential.user!.uid,
            userName: userCredential.user!.displayName ?? "no name",
            email: userCredential.user!.email ?? "no email");
        _users.doc(uid).set(userModel.toJson());
        return right(userModel);
      }

      // if (userCredential.additionalUserInfo!.isNewUser) {
      //   if (userSnapshot.docs.isEmpty) {
      //     userModel = UserModel(
      //         id: userCredential.user!.uid,
      //         userName: userCredential.user!.displayName ?? "no name",
      //         email: userCredential.user!.email ?? "no email");

      //     _users.doc(uid).set(userModel.toJson());
      //     return right(userModel);
      //   } else {
      //     await logOutgoogle();
      //     return left(Failure("EMAIL ALREADY REGISTERED"));
      //   }
      // } else {
      //   if ((userModel?.phoneNumber ?? '').isNotEmpty) {
      //     return right(userModel);
      //   } else {
      //     await logOutgoogle();
      //     return left(Failure("email already registered"));
      //   }
      // }
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //add details

  addDetails(
    BuildContext context,
    UserModel userModel,
  ) {
    _users.doc(userModel.id).update(userModel.updateJson());
    return right(userModel);
  }

  Stream<UserModel> getUserdata(String uid) {
    return _users.doc(uid).snapshots().map(
        (event) => UserModel.fromJson(event.data() as Map<String, dynamic>));
  }

  //sign emailpassword

  FutureEither<UserModel> loginUser(UserModel userModel) async {
    try {
      final res = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      );
      if (res.user == null) {
        return left(Failure('Login Failed ...'));
      } else {
        final user = await getCurrentAdmin(uid: res.user!.uid).first;
        print("user: ${user?.id}");
        print("user: ${user!.nickName}");

        if (user == null) {
          return left(Failure('No User Detected'));
        } else {
          return right(user);
        }
      }
    } on FirebaseException catch (e) {
      throw e.message ?? '';
    } catch (e) {
      print(e.toString());
      return left(Failure('Login Failed ...'));
    }
  }

  Stream<UserModel?> getCurrentAdmin({required String uid}) {
    return _firestore
        .collection(FirebaseConstants.users)
        .where("uid", isEqualTo: uid)
        .snapshots()
        .map((event) {
      if (event.docs.isEmpty) {
        return null;
      } else {
        return UserModel.fromJson(event.docs[0].data());
      }
    });
  }

  FutureVoid CreateUser({
    required String email,
    required String password,
    required UserModel userModel,
  }) async {
    try {
      final id = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      DocumentSnapshot doc = await _firestore
          .collection(FirebaseConstants.settings)
          .doc(FirebaseConstants.settings)
          .get();
      int idNumber = 0;
      try {
        idNumber = doc.get("user");
      } catch (e) {
        idNumber = 1000;
      }
      doc.reference.update({"user": FieldValue.increment(1)});

      String timestamp =
          "S${Timestamp.now().seconds.toString().substring(5, 10)}";

      String docId = "$timestamp-U$idNumber";
      userModel.id = docId;
      userModel.uid = id.user!.uid;
      //userModel.id = id.user!.uid;
      await _users.doc(docId).set(userModel.toJson());
      return right(userModel);
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  logOutgoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("id");
  }

  CollectionReference get _users {
    return _firestore.collection(FirebaseConstants.users);
  }
}
