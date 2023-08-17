import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Add_Detail extends StatefulWidget {
  const Add_Detail({super.key});

  @override
  State<Add_Detail> createState() => _Add_DetailState();
}
var width;
var height;

class _Add_DetailState extends State<Add_Detail> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:EdgeInsets.only(left: width*0.03,right: width*0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height:height*0.05,),
                SvgPicture.asset("assets/Signup.svg"),
                SizedBox(height:height*0.05,),
                Center(
                  child: Text("Add Your Details",style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,fontSize:width*0.038,color: Color(0xFF141414)),),
                ),
                SizedBox(height: width*0.1,),
                Container(
                  height: height*0.057,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF6F6F6F)),
                      borderRadius: BorderRadius.circular(width*0.03)

                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.02),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Nick  Name",
                          hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: width*0.03,color: Color(0xFF6F6F6F)),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                SizedBox(height: width*0.04,),
                Container(
                  height: height*0.057,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF6F6F6F)),
                      borderRadius: BorderRadius.circular(width*0.03)

                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.02),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize:  width*0.03,color: Color(0xFF6F6F6F)),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                SizedBox(height: width*0.2,),
                InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedBarExample(),));
                  },
                  child: Container(
                    height: width*0.12,
                    width: width*1,
                    decoration: BoxDecoration(
                        color: Color(0xFFE15145),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("Login",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: width*0.04,color: Colors.white))),
                  ),
                ),
                SizedBox(height: width*0.1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("Already have ",style: GoogleFonts.inter(color: Color(0xFF535353),fontWeight: FontWeight.w500,fontSize: width*0.025),),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text("an account",style: GoogleFonts.inter(color: Color(0xFFE15145),fontWeight: FontWeight.w500,fontSize: width*0.025),)),

                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
