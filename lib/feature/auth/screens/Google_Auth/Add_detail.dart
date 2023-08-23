import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soulknobe_customer/Model/UserModel.dart';
import 'package:soulknobe_customer/feature/auth/Controller/auth_Controller.dart';

import '../../../../Core/local/local_variables.dart';

class Add_Detail extends ConsumerStatefulWidget {
  UserModel userModel;
  Add_Detail({super.key, required this.userModel});

  @override
  _Add_DetailState createState() => _Add_DetailState();
}

class _Add_DetailState extends ConsumerState<Add_Detail> {
  final nickNameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nickNameController.text = widget.userModel.nickName!;
  }

  // getData() {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final authProvider = StateProvider<UserCredential?>((ref) => null);

    return SafeArea(
      child: Scaffold(
        body: Consumer(builder: (context, WidgetRef ref, Widget? child) {
          final authstate = ref.watch(authProvider);
          return Padding(
            padding: EdgeInsets.only(left: scrWidth * 0.03, right: scrWidth * 0.04),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: scrHeight * 0.05,
                    ),
                    SvgPicture.asset("assets/Signup.svg"),
                    SizedBox(
                      height: scrHeight * 0.05,
                    ),
                    Center(
                      child: Text(
                        "Add Your Details",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: scrWidth * 0.038,
                            color: const Color(0xFF141414)),
                      ),
                    ),
                    SizedBox(
                      height: scrWidth * 0.1,
                    ),
                    Container(
                      height: scrHeight * 0.057,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF6F6F6F)),
                          borderRadius: BorderRadius.circular(scrWidth * 0.03)),
                      child: Padding(
                        padding: EdgeInsets.only(left: scrWidth * 0.02),
                        child: TextFormField(
                          controller: nickNameController,
                          validator: (value) {
                            (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter NickName';
                              }
                              // if (value < 9) {
                              //   return "please enter 8 character";
                              // }
                              return null;
                            };
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Nick  Name",
                              hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: scrWidth * 0.03,
                                  color: const Color(0xFF6F6F6F)),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: scrWidth * 0.04,
                    ),
                    Container(
                      height: scrHeight * 0.057,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF6F6F6F)),
                          borderRadius: BorderRadius.circular(scrWidth * 0.03)),
                      child: Padding(
                        padding: EdgeInsets.only(left: scrWidth * 0.02),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter phoneNumber';
                              }
                              // if (value < 9) {
                              //   return "please enter 8 character";
                              // }
                              return null;
                            };
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Phone Number",
                              hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: scrWidth * 0.03,
                                  color: const Color(0xFF6F6F6F)),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: scrWidth * 0.2,
                    ),
                    InkWell(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          UserModel userModel = UserModel(
                            phoneNumber: passwordController.text,
                            nickName: nickNameController.text,
                            id: widget.userModel.id,
                          );

                          ref.read(authControllerProvider.notifier).addDetails(
                                context: context,
                                userModel: userModel,
                              );
                        }
                      },
                      child: Container(
                        height: scrWidth * 0.12,
                        width: scrWidth * 1,
                        decoration: BoxDecoration(
                            color: const Color(0xFFE15145),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text("Login",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: scrWidth * 0.04,
                                    color: Colors.white))),
                      ),
                    ),
                    SizedBox(
                      height: scrWidth * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have ",
                          style: GoogleFonts.inter(
                              color: const Color(0xFF535353),
                              fontWeight: FontWeight.w500,
                              fontSize: scrWidth * 0.025),
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
                                  fontSize: scrWidth * 0.025),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}


