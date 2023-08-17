import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../BottomNavigation/NavPage.dart';
import 'Forgot_Password.dart';
import 'Google_Login_Add_detail.dart';
import 'SignUp_Page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
var width;
var height;
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.only(left: width*0.03,right: width*0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: height*0.075,),
                SvgPicture.asset(
                  'assets/Login.svg',
                  alignment: Alignment.center,
                  width: width*1,
                  height: height*0.32,
                ),
                SizedBox(height: width*0.09,),
                Center(
                  child: Text("LOGIN TO YOUR ACCOUNT",style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,fontSize:16,color: Color(0xFF141414)),),
                ),
                SizedBox(height: width*0.06,),
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
                          hintText: "Email",
                          hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xFF6F6F6F)),
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
                          hintText: "Password",
                          hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xFF6F6F6F)),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                SizedBox(height: width*0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                      },
                      child: Row(
                        children: [
                          Text("Create Account",style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,fontSize:width*0.025,color: Color(0xFFE15145)),),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Forgot_Password(),));
                      },
                      child: Row(
                        children: [
                          Text("Forgot Password",style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,fontSize:width*0.025,color: Color(0xFFE15145)),),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: width*0.05,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>AnimatedBarExample()));
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
                SizedBox(height: width*0.05,),
                Center(
                  child: Text("-Or Sign Up With-",style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,fontSize: width*0.028,color: Color(0xFF787878)),),
                ),
                SizedBox(height: width*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Add_Detail(),));
                      },
                      child: Container(
                        height: height*0.06,
                        width: width*0.15,
                        decoration: BoxDecoration(
                          color:Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(width*0.02)
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/Google_Icon.svg',
                            alignment: Alignment.center,
                            height: height*0.035,
                            width: width*0.03,

                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width*0.04,),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Add_Detail(),));
                      },
                      child: Container(
                        height: height*0.06,
                        width: width*0.15,
                        decoration: BoxDecoration(
                            color:Color(0xFFF4F4F4),
                            borderRadius: BorderRadius.circular(width*0.02)
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/Apple_Icon.svg',
                            alignment: Alignment.center,
                            height: height*0.035,
                            width: width*0.03,


                          ),
                        ),
                      ),
                    ),


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
