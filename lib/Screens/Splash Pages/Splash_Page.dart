import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulknobe_customer/Core/Constants/firebase_constants/firebase_Constants.dart';
import 'package:soulknobe_customer/Core/firebase_Providers/firebase_Provider.dart';
import 'package:soulknobe_customer/Screens/BottomNavigation/NavPage.dart';
import 'package:soulknobe_customer/feature/auth/screens/Google_Auth/Google_Login_Add_detail.dart';
import 'package:soulknobe_customer/feature/auth/screens/Login_Pages/Login_Page.dart';

import '../../Core/local/local_variables.dart';
import '../../Model/UserModel.dart';
import 'Splash_Select_Language.dart';

class Splash_Page extends ConsumerStatefulWidget {
  const Splash_Page({super.key});

  @override
  _Splash_PageState createState() => _Splash_PageState();
}

final List<Language> languages = [
  Language(name: 'English', id: 1),
  Language(name: 'Malayalam', id: 2),
  Language(name: 'Hindi', id: 3),
  Language(name: 'Tamil', id: 4),
  // Add more languages as needed
];

class _Splash_PageState extends ConsumerState<Splash_Page> {
  bool load = false;
  void getData(WidgetRef ref, User data) async {
    
    ref
        .read(firestoreProvider)
        .collection(FirebaseConstants.users)
        .where("uid", isEqualTo: data.uid)
        .snapshots()
        .listen((event) {
      UserModel userData = UserModel.fromJson(event.docs.first.data());
      final userNotifier = ref.watch(userProvider.notifier);
      userNotifier.updateUser(userData);
    });
  }

  // void initState() {
  //   // TODO: implement initState
  //   Future.delayed(const Duration(seconds: 2)).then((value) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) =>
  //         ));
  //   });

  //   super.initState();
  // }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Timer(const Duration(seconds: 1), () {
      if (prefs.containsKey("id")) {
        ref
            .read(firestoreProvider)
            .collection(FirebaseConstants.users)
            .doc(prefs.getString("id"))
            .snapshots()
            .listen((event) {
          UserModel userData =
              UserModel.fromJson(event.data() as Map<String, dynamic>);
          final userNotifier = ref.watch(userProvider.notifier);
          userNotifier.updateUser(userData);
          if (userData.phoneNumber == "") {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Add_Detail(userModel: userData),
                ),
                (route) => false);
          } else {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const Navbar(),
                ),
                (route) => false);
          }
        });
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
            (route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    scrHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: scrWidth * 0.4,
              height: scrHeight * 0.3,
              color: Colors.white,
              child: SvgPicture.asset("assets/Splash_Image.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
