import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Core/local/local_variables.dart';
import 'otpPage.dart';

class Forgot_Password extends StatefulWidget {
  const Forgot_Password({super.key});

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:EdgeInsets.only(left: scrWidth*0.03,right: scrWidth*0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: scrHeight*0.10,),
                Center(child: SvgPicture.asset("assets/Forgot_Password.svg")),
                SizedBox(height: scrHeight*0.05,),
                Center(
                  child: Text("FORGOT PASSWORD",style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,fontSize:16,color: Color(0xFF141414)),),
                ),
                SizedBox(height: scrHeight*0.05,),
                Container(
                  height: scrHeight*0.057,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF6F6F6F)),
                      borderRadius: BorderRadius.circular(scrWidth*0.03)

                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: scrWidth*0.02),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xFF6F6F6F)),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                SizedBox(height: scrHeight*0.05,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OtpPage(),));
                  },
                  child: Container(
                    height: scrWidth*0.12,
                    width: scrWidth*1,
                    decoration: BoxDecoration(
                        color: Color(0xFFE15145),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("Get Otp",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.04,color: Colors.white))),
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
