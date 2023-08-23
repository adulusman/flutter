import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:soulknobe_customer/Model/UserModel.dart';
import 'package:soulknobe_customer/feature/auth/Controller/auth_Controller.dart';

import '../../../../Core/common/utils.dart';
import '../../../../Screens/BottomNavigation/NavPage.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

var width;
var height;

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final usenameController = TextEditingController();
  final emailController = TextEditingController();
  final nickNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String countryCode="";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final passwordVisibility = ref.watch(passwordeyeProvider);
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: width * 0.03, right: width * 0.04),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.06,
                  ),
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
                    width: width * 1,
                    height: height * 0.23,
                  ),
                  SizedBox(
                    height: width * 0.08,
                  ),

                  Text(
                    "Create Your Account",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: width * 0.04,
                        color: const Color(0xFF141414)),
                  ),
                  SizedBox(
                    height: width * 0.06,
                  ),

                  SizedBox(
                    height: width * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter NickName';
                        }
                        // if (value < 9) {
                        //   return "please enter 8 character";
                        // }
                        return null;
                      },
                      controller: nickNameController,
                      decoration: InputDecoration(
                          labelText: "Nick Name",
                          hintText: "Nick Name",
                          labelStyle: const TextStyle(color: Colors.black),
                          hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xFF6F6F6F)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Username';
                        }
                        // if (value < 9) {
                        //   return "please enter 8 character";
                        // }
                        return null;
                      },
                      controller: usenameController,
                      decoration: InputDecoration(
                          labelText: "User Name",
                          hintText: "User Name",
                          labelStyle: const TextStyle(color: Colors.black),
                          hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xFF6F6F6F)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Email';
                        }
                        var reg = RegExp(
                            r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+.[a-zA-Z]+$');
                        if (!reg.hasMatch(value)) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Email",
                          labelStyle: const TextStyle(color: Colors.black),
                          hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xFF6F6F6F)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.04,
                  ),
                  IntlPhoneField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: width * 0.05, horizontal: width * 0.01),
                      hintText: "Phone Number",
                      labelText: "Phone Number",
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color(0xFF6F6F6F),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF6F6F6F)),
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF6F6F6F)),
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value==0) {
                        return 'Please enter phoneNumber';
                      }
                      final RegExp phoneRegExp = RegExp(
                        r'^[0-9]{3}-[0-9]{3}-[0-9]{4}$', 
                      );
                      if (phoneRegExp.hasMatch(value.toString())) {
                        return 'Invalid phoneNumber';
                      }
                      return null;
                    },
                    onChanged: (phone) {
                      countryCode=phone.countryCode;
                      print(phone.countryCode);
                    },
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: width * 0.02),
                  //   child: TextFormField(
                  //     autovalidateMode: AutovalidateMode.onUserInteraction,
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'Please enter a phone number';
                  //       }
                  //       var reg = RegExp(r'^\+?\d{10}$');
                  //       if (!reg.hasMatch(value)) {
                  //         return 'Invalid phone number';
                  //       }
                  //       return null;
                  //     },
                  //     controller: phoneNumberController,
                  //     keyboardType: TextInputType.number,
                  //     decoration: InputDecoration(
                  //         labelText: "Phone Number",
                  //         labelStyle: const TextStyle(color: Colors.black),
                  //         hintText: "Phone Number",
                  //         hintStyle: GoogleFonts.inter(
                  //             fontWeight: FontWeight.w400,
                  //             fontSize: 12,
                  //             color: const Color(0xFF6F6F6F)),
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(15))),
                  //   ),
                  // ),
                  SizedBox(
                    height: width * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        // if (value < 9) {
                        //   return "please enter 8 character";
                        // }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: passwordVisibility,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () {
                                ref.read(passwordeyeProvider.notifier).state =
                                    !passwordVisibility;
                              },
                              child: passwordVisibility
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.remove_red_eye)),

                          // focusedBorder: InputBorder.none,
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Colors.black),
                          hintText: "Password",
                          hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xFF6F6F6F)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter ConfirmPassword';
                        }
                        // if (value < 9) {
                        //   return "please enter 8 character";
                        // }
                        return null;
                      },
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          labelText: "Confirm Password",
                          labelStyle: const TextStyle(color: Colors.black),
                          hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xFF6F6F6F)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.06,
                  ),
                  InkWell(
                    onTap: () async {
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        await registerUser();
                      } else {
                        showSnackBar(context, "PASSWORD DOES NOT MATCH");
                      }
                    },
                    child: Container(
                      height: width * 0.12,
                      width: width * 1,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE15145),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text("Sign Up",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.04,
                                  color: Colors.white))),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.045,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have ",
                        style: GoogleFonts.inter(
                            color: const Color(0xFF535353),
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.025),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "an account",
                            style: GoogleFonts.inter(
                                color: const Color(0xFFE15145),
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.025),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: width * 0.08,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  registerUser() {
    if (_formKey.currentState!.validate()) {
      UserModel userModel = UserModel(
        userName: usenameController.text,
        nickName: nickNameController.text,
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
        password: passwordController.text,
        countryCode: countryCode,
        search: setSearchParam(usenameController.text),
      );
      ref
          .read(authControllerProvider.notifier)
          .createUser(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              context: context,
              userModel: userModel)
          .then((value) {
        showSnackBar(context, "REGISTER SUCCESSFULL");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const NavBar()));
      });
    }
  }
}
