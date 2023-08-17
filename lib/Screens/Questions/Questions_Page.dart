import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Login_Pages/Login_Page.dart';

class Questions_Page extends StatefulWidget {
  const Questions_Page({super.key});

  @override
  State<Questions_Page> createState() => _Questions_PageState();
}

class _Questions_PageState extends State<Questions_Page> {
  bool checkFirst = true;
  bool checkSecond = false;
  bool checkThird = false;
  bool checkfour = false;
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: width*0.03,right: width*0.03),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height:height*0.04,
                ),
                InkWell(
                    onTap: () {
                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),), (route) => false);
                    },
                    child: Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Text("Skip",style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: width*0.04),))),
                SizedBox(
                  height:height*0.035,
                ),

                Container(
                  height: height * 0.35,
                  width: width * 0.7,
                  color: Colors.white,
                  child: SvgPicture.asset(
                    'assets/question1.svg',
                    alignment: Alignment.center,
                    width: width * 0.7,
                    height: height * 0.3,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Color(0xFF46A3DB),
                  radius: width*0.04,
                  child: Text("1"),
                ),
                SizedBox(
                  height: width*0.06,
                ),
                Center(child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: height*0.018))),
                SizedBox(
                  height: width*0.06,
                ),
                Container(
                  height: height*0.2,
                  width: width*1,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                checkFirst = true;
                                checkSecond = false;
                                checkThird = false;
                                checkfour=false;
                              });
                            },
                            child: Container(
                              height: height*0.05,
                              width: width*0.45,
                              decoration: BoxDecoration(
                                gradient: checkFirst?LinearGradient(colors: [Color(0xFF46A3DB), Color(0xFF006CAC)]) : LinearGradient(colors: [Colors.white,Colors.white]),
                                border: Border.all(color:Color(0xFF46A3DB)),
                                borderRadius: BorderRadius.circular(width*0.06)
                              ),
                              child: Center(child: Text("Dataa",style: GoogleFonts.inter(fontWeight: FontWeight.w500,color: checkFirst?Colors.white:Colors.blue))),
                            ),
                          ),


                          InkWell(
                            onTap: () {
                              setState(() {
                                checkFirst = false;
                                checkSecond = true;
                                checkThird = false;
                                checkfour=false;
                              });

                            },
                            child: Container(
                              height: height*0.05,
                              width: width*0.45,
                              decoration: BoxDecoration(
                                  gradient: checkSecond?LinearGradient(colors: [Color(0xFF46A3DB), Color(0xFF006CAC)]) :LinearGradient(colors: [Colors.white,Colors.white]),
                                  border: Border.all(color:Color(0xFF46A3DB)),
                                  borderRadius: BorderRadius.circular(width*0.06)
                              ),
                              child: Center(
                                  child: Text(
                                      "Dataa",style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,color:checkSecond?Colors.white:Colors.blue
                                  ))),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                checkFirst = false;
                                checkSecond = false;
                                checkThird = true;
                                checkfour=false;
                              });
                            },
                            child: Container(
                              height: height*0.05,
                              width: width*0.45,
                              decoration: BoxDecoration(
                                  gradient: checkThird?LinearGradient(colors: [Color(0xFF46A3DB), Color(0xFF006CAC)]) : LinearGradient(colors: [Colors.white,Colors.white]),
                                  border: Border.all(color:Color(0xFF46A3DB)),
                                  borderRadius: BorderRadius.circular(width*0.06)
                              ),
                              child: Center(child: Text("Dataa",style: GoogleFonts.inter(fontWeight: FontWeight.w500,color: checkThird?Colors.white:Colors.blue))),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                checkFirst = false;
                                checkSecond = false;
                                checkThird = false;
                                checkfour=true;
                              });

                            },
                            child: Container(
                              height: height*0.05,
                              width: width*0.45,
                              decoration: BoxDecoration(
                                  gradient: checkfour?LinearGradient(colors: [Color(0xFF46A3DB), Color(0xFF006CAC)]) : LinearGradient(colors: [Colors.white,Colors.white]),
                                  border: Border.all(color:Color(0xFF46A3DB)),
                                  borderRadius: BorderRadius.circular(width*0.06)
                              ),
                              child: Center(child: Text("Dataa",style: GoogleFonts.inter(fontWeight: FontWeight.w500,color:checkfour?Colors.white:Colors.blue))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: width*0.05,),
                InkWell(

                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                  },
                  child: Container(
                    height:height*0.055,
                    width: width*1,
                    decoration: BoxDecoration(
                        color: Color(0xFF46A3DB),
                        borderRadius: BorderRadius.circular(width*0.03)

                    ),
                    child:Center(
                      child: Text(
                        "Next",style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,fontSize: width*0.05,color: Color(0xFFFFFFFF)),),
                    ),

                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
