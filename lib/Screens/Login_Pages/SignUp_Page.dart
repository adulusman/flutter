import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

var width;
var height;

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:  EdgeInsets.only(left: width*0.03,right: width*0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height*0.06,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     InkWell(
                //         onTap: () {
                //           Navigator.pop(context);
                //         },
                //         child: Icon(Icons.arrow_back_sharp,color: Colors.black,)),
                //   ],
                // ),
                SvgPicture.asset(
                  'assets/Signup.svg',
                  alignment: Alignment.center,
                  width: width*1,
                  height: height*0.23 ,
                ),
                SizedBox(height: width*0.08,),

                Text("Create Your Account",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: width*0.04,color: Color(0xFF141414)),),
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
                          hintText: "Nick Name",
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
                          hintText: "User Name",
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Phone Number",
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
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
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
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xFF6F6F6F)),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                SizedBox(height: width*0.06,),
                InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) =>));
                  },

                  child: Container(
                    height: width*0.12,
                    width: width*1,
                    decoration: BoxDecoration(
                        color: Color(0xFFE15145),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("Sign Up",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: width*0.04,color: Colors.white))),
                  ),
                ),
                SizedBox(height: width*0.045,),
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
