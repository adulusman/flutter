import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../Core/local/local_variables.dart';
import 'Splash_Select_Language.dart';

class Splash_Page extends StatefulWidget {
  const Splash_Page({super.key});

  @override
  State<Splash_Page> createState() => _Splash_PageState();
}


final List<Language> languages = [
  Language(name: 'English', id: 1),
  Language(name: 'Malayalam', id: 2),
  Language(name: 'Hindi', id: 3),
  Language(name: 'Tamil', id: 4),
  // Add more languages as needed
];

class _Splash_PageState extends State<Splash_Page> {

  @override

  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.push(context,MaterialPageRoute(builder: (context) => LanguageSelectionWidget(languages: languages),));
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    scrWidth = MediaQuery.sizeOf(context).width;
     scrHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.white,
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




