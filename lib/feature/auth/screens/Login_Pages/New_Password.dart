import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Screens/BottomNavigation/NavPage.dart';

class New_Password extends StatefulWidget {
  const New_Password({super.key});

  @override
  State<New_Password> createState() => _New_PasswordState();
}

var width;
var height;

class _New_PasswordState extends State<New_Password> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: width * 0.03, right: width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Center(
                    child: SvgPicture.asset(
                  "assets/Login.svg",
                  height: height * 0.34,
                  width: width * 1,
                )),
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                  child: Text(
                    "Enter Your New Password",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: width * 0.04,
                        color: Color(0xFF141414)),
                  ),
                ),
                SizedBox(
                  height: width * 0.06,
                ),
                Container(
                  height: height * 0.057,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF6F6F6F)),
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "New Password",
                          hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.03,
                              color: Color(0xFF6F6F6F)),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.04,
                ),
                Container(
                  height: height * 0.057,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF6F6F6F)),
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.03,
                              color: Color(0xFF6F6F6F)),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.1,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Navbar(),
                        ));
                  },
                  child: Container(
                    height: width * 0.12,
                    width: width * 1,
                    decoration: BoxDecoration(
                        color: Color(0xFFE15145),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text("Login",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.04,
                                color: Colors.white))),
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
