import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulknobe_customer/Screens/Splash%20Pages/Splash_Page.dart';

import '../../../Core/common/utils.dart';
import '../../../Model/UserModel.dart';
import '../Repository/auth_Repository.dart';
import '../screens/Google_Auth/Add_detail.dart';

// final userProvider = StateProvider<UserModel?>((ref) => null);
// final userproviders = StateProvider<UserModel?>((ref) => null);
final nicknameProvider = StateProvider((ref) => "");

final authControllerProvider =
    StateNotifierProvider<LoginController, bool>((ref) {
  return LoginController(
    authRepository: ref.watch(authRepositoryProvider),
    ref: ref,
  );
});

final getUserDataProvider =
    StreamProvider.autoDispose.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

final authStateChangeStream = StreamProvider.autoDispose((ref) {
  final rep = ref.watch(authControllerProvider.notifier);
  return rep.authStateChange;
});

final passwordeyeProvider = StateProvider<bool>((ref) {
  return true;
});

class LoginController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;
  LoginController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false);

  GoogleSignIn googleSignIn = GoogleSignIn();

  final firebase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final googlesign = GoogleSignIn();

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  //google sign in
  void signWithgoogle(
    BuildContext context,
    //UserModel userModel,
  ) async {
    state = true;
    final user = await _authRepository.signInWithGoogle(context);

    state = false;
    user.fold((l) => showSnackBar(context, l.message), (userModel) async {
      // _ref.read(userProvider.notifier).update((state) => userModel);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("id", userModel.id!);
      if (userModel.phoneNumber == "") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Add_Detail(userModel: userModel),
            ),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Splash_Page(),
            ),
            (route) => false);
      }
    });
  }

//email login

  // final userproviders = StateProvider<UserModel?>((ref) => null);

  Future<void> loginUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = true;

    try {
      final usermodel = UserModel(
        email: email,
        password: password,
      );
      final res = await AuthRepository(
              firestore: firebase, auth: auth, googleSignIn: googleSignIn)
          .loginUser(usermodel);

      // _ref.read(userproviders.notifier).update((state) => usermodel);
      _ref.read(nicknameProvider.notifier).state =
          usermodel.nickName.toString();
      print("result");
      print("nick: ${usermodel.nickName} ");

      res.fold((l) {
        state = false;
        showSnackBar(context, l.message);
      }, (usermodel) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("id", usermodel.id!);
        state = false;
        showSnackBar(context, 'Login Successfully Completed');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Splash_Page(),
            ),
            (route) => false);
      });
    } catch (e) {
      state = false;
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login Error")));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _authRepository.getUserdata(uid);
  }

//email signup

  Future<void> createUser(
      {required String email,
      required BuildContext context,
      required String password,
      required UserModel userModel}) async {
    state = true;
    final authRepository = _ref.watch(authRepositoryProvider);
    final res = await authRepository.CreateUser(
        email: email, password: password, userModel: userModel);
    final usermode = userModel;
    // _ref.read(userproviders.notifier).update((state) => usermode);
    _ref.read(nicknameProvider.notifier).state = usermode.nickName.toString();
    print("nickName : ${nicknameProvider.toString()}");

    state = false;
    res.fold((l) {
      showSnackBar(context, l.message);
    }, (r) {
      showSnackBar(context, "Register successfull");
    });
  }

  addDetails(
      {required BuildContext context, required UserModel userModel}) async {
    final repository = _ref.watch(authRepositoryProvider);
    final res = await repository.addDetails(context, userModel);
    res.fold((l) {
      showSnackBar(context, l.message);
    }, (r) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Splash_Page(),
          ),
          (route) => false);
    });
  }

  void logout() async {
    _authRepository.logOutgoogle();
  }

  // logoutUser() {
  //   ref.watch(authRepositoryProvider).logOutUser();
  // }

  @override
  build() {
    return false;
  }
}
