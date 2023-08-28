import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Core/local/local_variables.dart';
import 'New_Password.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}


class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:EdgeInsets.only(left: scrWidth*0.03,right: scrWidth*0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: scrHeight*0.13,),
                Center(child: SvgPicture.asset("assets/Otp.svg",height: scrHeight*0.24,width:scrWidth*1,)),
                SizedBox(height: scrHeight*0.05,),
                Center(
                  child: Text("Enter OTP",style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,fontSize:16,color: Color(0xFF141414)),),
                ),
                SizedBox(height: scrHeight*0.03,),
                Container(
                  height: scrWidth * 0.3,
                  width: scrWidth * 1,
                  color: Colors.white,
                  child: OtpTextField(
                    fieldWidth: 50,
                    borderWidth: 2,
                    numberOfFields: 6,
                    fillColor: Colors.grey,
                    focusedBorderColor: Colors.green,
                    showFieldAsBox: true,
                    borderRadius: BorderRadius.circular(scrWidth*0.3),


                    // onSubmit: () {
                    // },
                  ),

                ),
                SizedBox(height: scrHeight*0.05,),
                InkWell(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => New_Password(),));
                  },
                  child: Container(
                    height: scrWidth*0.12,
                    width: scrWidth*1,
                    decoration: BoxDecoration(
                        color: Color(0xFFE15145),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("Verify",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.04,color: Colors.white))),
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
