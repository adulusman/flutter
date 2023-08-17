import 'package:flutter/material.dart';

import 'Screens/Splash Pages/Splash_Page.dart';
import 'Screens/Splash Pages/Splash_Select_Language.dart';

void main() {
  runApp(const MyApp());
}
var width;
var height;


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Splash_Page(),
      ),
    );
  }
}

