import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../Core/local/local_variables.dart';
import '../../Screens/Login_Pages/Login_Page.dart';
import '../Login_Pages/Screens/Individual_Corporate_Login.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}
class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();


  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const Individual_Corporate()),
    );
  }

  @override
  Widget build(BuildContext context) {


    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: false,
      pages: [
        PageViewModel(

          titleWidget: Align(
            alignment: Alignment.topRight,
            child: Container()
          ),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              SizedBox(height: scrHeight*0.04),

              Center(
                child:Image.asset("assets/logo.png",height: scrHeight*0.08,width: scrWidth*0.22,)

              ),
              SizedBox(height:scrHeight*0.04,),

              Center(child: Text("Find A Best Peer Groups",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.057),)),
              SizedBox(height: scrWidth*0.06,),
              Center(
                child: SvgPicture.asset(
                  'assets/onboarding1.svg',
                  alignment: Alignment.center,
                  width: scrWidth*1,
                  height: scrHeight*0.37,
                ),
              ),

            ],
          ),
          decoration: const PageDecoration(
            pageColor: Colors.white,
          ),
        ),
        PageViewModel(

          titleWidget: Align(
            alignment: Alignment.topRight,
            child:Container()
          ),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              SizedBox(height: scrHeight*0.04,),

              Center(
                  child:Image.asset("assets/logo.png",height: scrHeight*0.08,width: scrWidth*0.22,)

              ),
              SizedBox(height: scrHeight*0.04,),
              Center(
                child: Text(
                  "Scheduled Appointments With",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.057),),
              ),

              Center(
                child: Text(
                  "Expert Doctors",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.057),),
              ),
              SizedBox(height: scrWidth*0.08,),
              Center(
                child: Container(
                  height: scrHeight*0.4,
                  width: scrWidth*1,
                  color:Colors.white,
                  child: SvgPicture.asset(
                    'assets/onboarding2.svg',
                    alignment: Alignment.center,
                    width: scrWidth*1,
                    height: scrHeight*0.55,
                  ),
                ),
              ),

            ],
          ),
          decoration: const PageDecoration(
            pageColor: Colors.white,
          ),
        ),
        PageViewModel(

          titleWidget: Align(
            alignment: Alignment.topRight,
            child: Container()

          ),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              SizedBox(height: scrHeight*0.04,),

              Center(
                  child:Image.asset("assets/logo.png",height: scrHeight*0.08,width: scrWidth*0.22,)

              ),
              SizedBox(height: scrHeight*0.04,),

              Center(
                child: Text(
                  "Attend Questions And Check",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.057),),
              ),
              Center(
                child: Text(
                  "Your Mood",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.057),),
              ),
              SizedBox(height: scrWidth*0.08,),
              Center(
                child: Container(
                  height: scrHeight*0.4,
                  width: scrWidth*1,
                  color:Colors.white,
                  child: SvgPicture.asset(
                    'assets/onboarding3.svg',
                    alignment: Alignment.center,
                    width: scrWidth*1,
                    height: scrHeight*0.55,
                  ),
                ),
              ),

            ],
          ),
          decoration: const PageDecoration(
            pageColor: Colors.white,
          ),
        ),

      ],
      onDone: () => _onIntroEnd(context),
      // showSkipButton: false, // Hide the default skip button
      next:  Container(
        height: scrHeight*0.046,
        width: scrWidth*0.24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(scrWidth*0.03),
          color: Color(0xFFE15145),
        ),
        child: Center(child: Text("Next",style: GoogleFonts.inter(fontWeight: FontWeight.w600,color: Color(0xFFFFFFFF),fontSize: scrWidth*0.04))),
      ),
      done: InkWell(
        onTap: () {
          _onIntroEnd(context);
        },
        child: Container(
          height: scrHeight*0.046,
          width: scrWidth*0.24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(scrWidth*0.03),
            color: Color(0xFFE15145),
          ),
          child: Center(child: Text("Next",style: GoogleFonts.inter(fontWeight: FontWeight.w600,color: Color(0xFFFFFFFF),fontSize: scrWidth*0.04))),
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 20.0),
      dotsDecorator:  DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        spacing: EdgeInsets.all(8.0), // Adjust spacing as needed
        activeColor: Colors.blue, // Set the color of active dot
      ),
    );
  }
}

