// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';


// class Individual_Corporate extends ConsumerStatefulWidget {
//   const Individual_Corporate({super.key});

//   @override
//   ConsumerState<Individual_Corporate> createState() => _Individual_CorporateState();
// }

// class _Individual_CorporateState extends ConsumerState<Individual_Corporate> {

//   TextEditingController indiidualemailController = TextEditingController();
//   TextEditingController indiidualpasswordController = TextEditingController();
//   TextEditingController corporateemailController = TextEditingController();
//   TextEditingController corporatepasswordController = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final emailvalidator=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{3}$');
//   // final passwordvalidator=RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');





//   @override
//   Widget build(BuildContext context) {
//     final passwordVisibility = ref.watch(passwordeyeProvider);




//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: EdgeInsets.only(left: scrWidth*0.03,right:scrWidth*0.03),
//           child: Column(
//             children: [
//               SizedBox(height: scrHeight*0.02,),
//               Center(child: SvgPicture.asset("assets/Login.svg",height: scrHeight*0.25,width:scrWidth*1,)),

//               SizedBox(height: scrHeight*0.02,),
//               Expanded(
//                 child: Container(
//                   child: DefaultTabController(
//                       length: 2,
//                       child: Column(
//                         children: [
//                           TabBar(
//                             indicatorColor: Color(0xffE15145),
//                             tabs: [
//                               Tab(
//                                   child: Text("INDIVIDUAL LOGIN",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: scrWidth*0.035,color: Colors.black),)
//                               ),
//                               Tab(
//                                   child: Text("CORPORATE LOGIN",style: GoogleFonts.inter(fontSize:  scrWidth*0.035,fontWeight: FontWeight.w700,color: Colors.black),)                              ),

//                             ],),
//                           Expanded(
//                             flex: 1,
//                             child: TabBarView(
//                                 physics: NeverScrollableScrollPhysics(),
//                                 children:[
//                                   SingleChildScrollView(
//                                     child: Container(
//                                       color: Colors.white,
//                                       child: Form(
//                                         key: formKey,
//                                         child: Column(
//                                           children: [
//                                             SizedBox(height: scrHeight*0.04,),
//                                             TextFormField(
//                                               controller: indiidualemailController,
//                                               obscureText: false,
//                                               decoration: InputDecoration(
//                                                 contentPadding: EdgeInsets.symmetric(vertical: scrWidth*0.03,horizontal: scrWidth*0.02),
//                                                 hintText: "Email",
//                                                 labelText: "Email",
//                                                 hintStyle: GoogleFonts.inter(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 12,
//                                                   color: Color(0xFF6F6F6F),
//                                                 ),
//                                                 border: OutlineInputBorder(
//                                                   borderSide: BorderSide(color: Color(0xFF6F6F6F)),
//                                                   borderRadius: BorderRadius.circular(scrWidth * 0.03),
//                                                 ),
//                                                 focusedBorder: OutlineInputBorder(
//                                                   borderSide: BorderSide(color: Color(0xFF6F6F6F)),
//                                                   borderRadius: BorderRadius.circular(scrWidth * 0.03),
//                                                 ),
//                                                 errorBorder: OutlineInputBorder(
//                                                   borderSide: BorderSide(color: Colors.red), // Customize the error border color
//                                                   borderRadius: BorderRadius.circular(scrWidth * 0.03),
//                                                 ),
//                                                 errorStyle: TextStyle(fontSize: 12), // Customize the error text style
//                                               ),
//                                               keyboardType: TextInputType.emailAddress,
//                                               autovalidateMode: AutovalidateMode.onUserInteraction,
//                                               validator: (value) {
//                                                 if (value!.isEmpty || !emailvalidator.hasMatch(value)) {
//                                                   return "Enter valid Email";
//                                                 } else {
//                                                   return null;
//                                                 }
//                                               },
//                                             ),
//                                             SizedBox(height: scrWidth*0.04,),
//                                             TextFormField(
//                                               controller: indiidualpasswordController,
//                                               obscureText: passwordVisibility,
//                                               decoration: InputDecoration(
//                                                 suffixIcon: InkWell(
//                                                     onTap: () {
//                                                       ref.read(passwordeyeProvider.notifier).state = !passwordVisibility;
//                                                     },
//                                                     child: passwordVisibility
//                                                         ? Icon(Icons.visibility_off)
//                                                         : Icon(Icons.remove_red_eye)),
//                                                 contentPadding: EdgeInsets.symmetric(vertical: scrWidth*0.03,horizontal: scrWidth*0.02),
//                                                 hintText: "Password",
//                                                 labelText: "Password",
//                                                 hintStyle: GoogleFonts.inter(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 12,
//                                                   color: Color(0xFF6F6F6F),
//                                                 ),
//                                                 border: OutlineInputBorder(
//                                                   borderSide: BorderSide(color: Color(0xFF6F6F6F)),
//                                                   borderRadius: BorderRadius.circular(scrWidth * 0.03),
//                                                 ),
//                                                 focusedBorder: OutlineInputBorder(
//                                                   borderSide: BorderSide(color: Color(0xFF6F6F6F)),
//                                                   borderRadius: BorderRadius.circular(scrWidth * 0.03),
//                                                 ),
//                                                 errorBorder: OutlineInputBorder(
//                                                   borderSide: BorderSide(color: Colors.red), // Customize the error border color
//                                                   borderRadius: BorderRadius.circular(scrWidth * 0.03),
//                                                 ),
//                                                 errorStyle: TextStyle(fontSize: 12), // Customize the error text style
//                                               ),
//                                               keyboardType: TextInputType.emailAddress,
//                                               autovalidateMode: AutovalidateMode.onUserInteraction,
//                                               validator: (value) {
//                                                 if (value!.isEmpty || value==null) {
//                                                   return "Enter valid Password";
//                                                 } else {
//                                                   return null;
//                                                 }
//                                               },
//                                             ),
//                                             SizedBox(height: scrWidth*0.03,),
//                                             Row(
//                                               mainAxisAlignment: MainAxisAlignment.end,
//                                               children: [
//                                                 InkWell(
//                                                   onTap: () {
//                                                     Navigator.push(context, MaterialPageRoute(builder: (context) => Forgot_Password(),));
//                                                   },
//                                                   child: Row(
//                                                     children: [
//                                                       Text("Forgot Password",style: GoogleFonts.inter(
//                                                           fontWeight: FontWeight.w500,fontSize:scrWidth*0.025,color: Color(0xFFE15145)),),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             SizedBox(height: scrWidth*0.08,),
//                                             InkWell(
//                                               onTap: () {
//                                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnimatedBarExample(),));
//                                               },
//                                               child: Container(
//                                                 height: scrWidth*0.12,
//                                                 width: scrWidth*1,
//                                                 decoration: BoxDecoration(
//                                                     color: Color(0xFFE15145),
//                                                     borderRadius: BorderRadius.circular(10)
//                                                 ),
//                                                 child: Center(child: Text("Login",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.04,color: Colors.white))),
//                                               ),
//                                             ),
//                                             SizedBox(height: scrWidth*0.04,),

//                                             InkWell(
//                                               onTap: () {
//                                                 Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
//                                               },

//                                               child: Container(
//                                                 height: scrWidth*0.12,
//                                                 width: scrWidth*1,
//                                                 decoration: BoxDecoration(
//                                                     border: Border.all(color: Color(0xFFE15145)),
//                                                     borderRadius: BorderRadius.circular(10)
//                                                 ),
//                                                 child: Center(child: Text("Create Your Account",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.04,color: Colors.black))),
//                                               ),
//                                             ),
//                                             SizedBox(height: scrWidth*0.1,),

//                                             Center(
//                                               child: Text("-Or Sign Up With-",style: GoogleFonts.inter(
//                                                   fontWeight: FontWeight.w400,fontSize: scrWidth*0.028,color: Color(0xFF787878)),),
//                                             ),
//                                             SizedBox(height: scrWidth*0.05,),
//                                             Row(
//                                               mainAxisAlignment: MainAxisAlignment.center,
//                                               children: [
//                                                 InkWell(
//                                                   onTap: () {
//                                                     Navigator.push(context, MaterialPageRoute(builder: (context) => Add_Detail(),));
//                                                   },
//                                                   child: Center(
//                                                     child: SvgPicture.asset(
//                                                       'assets/Google_Icon.svg',
//                                                       alignment: Alignment.center,
//                                                       height: scrHeight*0.035,
//                                                       width: scrWidth*0.03,

//                                                     ),
//                                                   ),
//                                                 ),
//                                                 SizedBox(width: scrWidth*0.09,),
//                                                 InkWell(
//                                                   onTap: () {
//                                                     Navigator.push(context, MaterialPageRoute(builder: (context) => Add_Detail(),));
//                                                   },
//                                                   child: Center(
//                                                     child: SvgPicture.asset(
//                                                       'assets/Apple_Icon.svg',
//                                                       alignment: Alignment.center,
//                                                       height: scrHeight*0.035,
//                                                       width: scrWidth*0.03,


//                                                     ),
//                                                   ),
//                                                 ),


//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SingleChildScrollView(
//                                     child: Container(
//                                       color: Colors.white,
//                                       child: Form(
//                                         key: formKey,
//                                         child: Column(
//                                           children: [
//                                             SizedBox(height: scrHeight*0.04,),
//                                             TextFormField(
//                                               controller: corporateemailController,
//                                               obscureText: false,
//                                               decoration: InputDecoration(
//                                                 contentPadding: EdgeInsets.symmetric(vertical: scrWidth*0.03,horizontal: scrWidth*0.02),
//                                                 hintText: "Email",
//                                                 labelText: "Email",
//                                                 hintStyle: GoogleFonts.inter(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 12,
//                                                   color: Color(0xFF6F6F6F),
//                                                 ),
//                                                 border: OutlineInputBorder(
//                                                   borderSide: BorderSide(color: Color(0xFF6F6F6F)),
//                                                   borderRadius: BorderRadius.circular(scrWidth * 0.03),
//                                                 ),
//                                                 focusedBorder: OutlineInputBorder(
//                                                   borderSide: BorderSide(color: Color(0xFF6F6F6F)),
//                                                   borderRadius: BorderRadius.circular(scrWidth * 0.03),
//                                                 ),
//                                                 errorBorder: OutlineInputBorder(
//                                                   borderSide: BorderSide(color: Colors.red), // Customize the error border color
//                                                   borderRadius: BorderRadius.circular(scrWidth * 0.03),
//                                                 ),
//                                                 errorStyle: TextStyle(fontSize: 12), // Customize the error text style
//                                               ),
//                                               keyboardType: TextInputType.emailAddress,
//                                               autovalidateMode: AutovalidateMode.onUserInteraction,
//                                               validator: (value) {
//                                                 if (value!.isEmpty || !emailvalidator.hasMatch(value)) {
//                                                   return "Enter valid Email";
//                                                 } else {
//                                                   return null;
//                                                 }
//                                               },
//                                             ),
//                                             SizedBox(height: scrWidth*0.04,),
//                                             TextFormField(
//                                               controller: corporatepasswordController,
//                                               obscureText: passwordVisibility,
//                                               decoration: InputDecoration(
//                                                 suffixIcon: InkWell(
//                                                     onTap: () {
//                                                       ref.read(passwordeyeProvider.notifier).state = !passwordVisibility;
//                                                     },
//                                                     child: passwordVisibility
//                                                         ? Icon(Icons.visibility_off)
//                                                         : Icon(Icons.remove_red_eye)),
//                                                 contentPadding: EdgeInsets.symmetric(vertical: scrWidth*0.03,horizontal: scrWidth*0.02),
//                                                 hintText: "Password",
//                                                 labelText: "Password",
//                                                 hintStyle: GoogleFonts.inter(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 12,
//                                                   color: Color(0xFF6F6F6F),
//                                                 ),
//                                                 border: OutlineInputBorder(
//                                                   borderSide: BorderSide(color: Color(0xFF6F6F6F)),
//                                                   borderRadius: BorderRadius.circular(scrWidth * 0.03),
//                                                 ),
//                                                 focusedBorder: OutlineInputBorder(
//                                                   borderSide: BorderSide(color: Color(0xFF6F6F6F)),
//                                                   borderRadius: BorderRadius.circular(scrWidth * 0.03),
//                                                 ),
//                                                 errorBorder: OutlineInputBorder(
//                                                   borderSide: BorderSide(color: Colors.red), // Customize the error border color
//                                                   borderRadius: BorderRadius.circular(scrWidth * 0.03),
//                                                 ),
//                                                 errorStyle: TextStyle(fontSize: 12), // Customize the error text style
//                                               ),
//                                               keyboardType: TextInputType.emailAddress,
//                                               autovalidateMode: AutovalidateMode.onUserInteraction,
//                                               validator: (value) {
//                                                 if (value!.isEmpty || value==null) {
//                                                   return "Enter valid Password";
//                                                 } else {
//                                                   return null;
//                                                 }
//                                               },
//                                             ),
//                                             SizedBox(height: scrWidth*0.03,),
//                                             Row(
//                                               mainAxisAlignment: MainAxisAlignment.end,
//                                               children: [
//                                                 InkWell(
//                                                   onTap: () {
//                                                     Navigator.push(context, MaterialPageRoute(builder: (context) => Forgot_Password(),));
//                                                   },
//                                                   child: Row(
//                                                     children: [
//                                                       Text("Forgot Password",style: GoogleFonts.inter(
//                                                           fontWeight: FontWeight.w500,fontSize:scrWidth*0.025,color: Color(0xFFE15145)),),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             SizedBox(height: scrWidth*0.08,),
//                                             InkWell(
//                                               onTap: () {
//                                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnimatedBarExample(),));
//                                               },
//                                               child: Container(
//                                                 height: scrWidth*0.12,
//                                                 width: scrWidth*1,
//                                                 decoration: BoxDecoration(
//                                                     color: Color(0xFFE15145),
//                                                     borderRadius: BorderRadius.circular(10)
//                                                 ),
//                                                 child: Center(child: Text("Login",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.04,color: Colors.white))),
//                                               ),
//                                             ),
//                                             SizedBox(height: scrWidth*0.04,),

//                                             InkWell(
//                                               onTap: () {
//                                                 Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
//                                               },

//                                               child: Container(
//                                                 height: scrWidth*0.12,
//                                                 width: scrWidth*1,
//                                                 decoration: BoxDecoration(
//                                                     border: Border.all(color: Color(0xFFE15145)),
//                                                     borderRadius: BorderRadius.circular(10)
//                                                 ),
//                                                 child: Center(child: Text("Create Your Account",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.04,color: Colors.black))),
//                                               ),
//                                             ),
//                                             SizedBox(height: scrWidth*0.1,),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ]

//                             ),
//                           )

//                         ],
//                       )),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }