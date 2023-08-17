

import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}
var height;
var width;
class _Home_PageState extends State<Home_Page> {


  final List<String> imgList = [
    "assets/onboarding3.svg",
    "assets/onboarding3.svg",
    "assets/onboarding3.svg",
  ];
  List<StepperData> stepperData = [
    StepperData(
      title: StepperText(
        "Sleep 8 Hours",
        textStyle:  TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 12
        ),
      ),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color(0xFFFF492B),
          shape: BoxShape.circle
        ),
        child:SvgPicture.asset("assets/stepper_verified.svg"),
      ),
    ),
    StepperData(
      title: StepperText(
        "Drink Water",
        textStyle:  TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 12
        ),
      ),
      // subtitle: StepperText("Your order has been placed"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color(0xFFFF492B),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child:SvgPicture.asset("assets/stepper_unverified.svg"),
      ),




    ),
    StepperData(
      title: StepperText(
        "Sleep 8 Hours",
        textStyle:  TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 12
        ),
      ),
      // subtitle: StepperText("Your order has been placed"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color(0xFFFF492B),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child:SvgPicture.asset("assets/stepper_unverified.svg"),
      ),




    ),
  ];
  double _value = 1.0;
  Widget _buildThumbIcon() {
    String imagePath;

    if (_value.toInt().floor() < 5) {
      imagePath = "assets/sad.png";
    } else if (_value.toInt().floor() >= 5 && _value.toInt().floor() < 8) {
      imagePath = "assets/confused.png";
    } else {
      imagePath = "assets/happy.png";
    }

    return SizedBox(
      width: 46,
      height: 46,
      child: ClipOval(
        child: Image.asset(imagePath)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     width = MediaQuery.of(context).size.width;
     height = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(width*0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFFFFCB14),
                          child: Text("S",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white)),
                        ),
                        SizedBox(width: width*0.03,),
                        Text("Hi",style: TextStyle(fontWeight: FontWeight.w700,color: Color(0xFFA4A4A4)),),
                        SizedBox(width: width*0.01,),
                        Text("Serin John",style: TextStyle(fontWeight: FontWeight.w700,color:Colors.black,),)
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/Icon_1.svg")
                      ],
                    )

                  ],
                ),
                SizedBox(height: height*0.04,),
                Container(
                  height: height*0.6,
                  width: width*1,
                  color: Colors.white,
                  child:CarouselSlider(
                    options: CarouselOptions(
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 1,
                      autoPlay: true,
                    ),
                    items: imgList
                        .map((item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height*0.55,
                        width: width*1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: SvgPicture.asset(item,fit: BoxFit.contain),

                      ),
                    ))
                        .toList(),

                  ),
                ),
                SizedBox(height: height*0.04,),
                Row(
                  children: [
                    Text("Goals ",style: TextStyle(fontWeight: FontWeight.w600),),
                    Text("(21 Days)",style: TextStyle(fontWeight: FontWeight.w600),),

                  ],
                ),
                SizedBox(height: height*0.04,),
                Container(
                  height: height * 0.076,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4, // Set the itemCount to 5
                    itemBuilder: (context, index) {
                      return Container(
                        width: width * 0.25,
                        margin: EdgeInsets.symmetric(horizontal: 8), // Add some horizontal margin
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(child: Text("21 Days")),
                      );
                    },
                  ),
                ),
                SizedBox(height: height*0.04,),
                Row(
                  children: [
                    Text("Today ",style: TextStyle(fontWeight: FontWeight.w600),),
                    Text("(Day 4)",style: TextStyle(fontWeight: FontWeight.w600),),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height:300,
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AnotherStepper(
                            stepperList: stepperData,
                            stepperDirection: Axis.vertical,
                            iconWidth: 30,
                            iconHeight: 30,
                            activeBarColor: Color(0xFFFF492B),
                            inActiveBarColor: Colors.grey,
                            inverted: false,
                            verticalGap: 26,
                            activeIndex: 1,
                            barThickness: 2,

                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      width:50,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Icon(CupertinoIcons.check_mark_circled),
                         Icon(CupertinoIcons.check_mark_circled),
                         Icon(CupertinoIcons.check_mark_circled),
                       ],
                     ),),
                    
                  ],
                ),
             
                Row(
                  children: [
                    Column(
                      children: [
                        Text("Mar",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: width*0.03)),
                        Text("01",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: width*0.03)),

                      ],
                    ),
                    SizedBox(width: width*0.03,),
                    SizedBox(
                      width:width*0.8,
                      child: SfSliderTheme(
                        data: SfSliderThemeData(
                            thumbColor: Colors.white,
                            thumbRadius: 20,
                            // thumbStrokeWidth: 1,
                            thumbStrokeColor: Colors.white,
                          activeTrackHeight: 13,
                          inactiveTrackHeight: 12

                        ),
                        child: Center(
                          child: SfSlider(
                            min: 1.0,
                            max: 10.0,
                            interval: 1,
                            showLabels: false,
                            value: _value,
                            thumbIcon: _buildThumbIcon(),
                            inactiveColor: Color(0xFFFFB6AD),
                            activeColor: Color(0xFFDE1F27),

                            onChanged: (dynamic newValue) {
                              setState(() {

                                _value = newValue;
                                print(_value.floor());
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),






              ],
            ),
          ),
        ),
      ),
    );
  }
}




