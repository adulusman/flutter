import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soulknobe_customer/Core/firebase_Providers/firebase_Provider.dart';
import 'package:soulknobe_customer/Model/UserModel.dart';

import '../../../../Core/Constants/firebase_constants/firebase_Constants.dart';

final homerepositoryProvider = Provider((ref) {
  return HomeRepository(firestore: ref.watch(firestoreProvider));
});

class HomeRepository  {
  final FirebaseFirestore _firestore;

  HomeRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;


  Stream<UserModel?> getGoals({UserModel? userModel}) {
    return _firestore
        .collection(FirebaseConstants.goals)
        .snapshots()
        .map((event) {
      if (event.docs.isEmpty) {
        return null;
      } else {
        return UserModel.fromJson(event.docs[0].data());
      }
    });
  }

  CollectionReference get _goals {
    return _firestore.collection(FirebaseConstants.goals);
  }
}
