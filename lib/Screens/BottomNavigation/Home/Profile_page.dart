import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soulknobe_customer/Core/Constants/colors.dart';
import 'package:soulknobe_customer/Core/Constants/size.dart';
import 'package:soulknobe_customer/Screens/BottomNavigation/Home/Controller/Profile_page_Controller.dart';

import '../../../Core/local/local_variables.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});
  @override
  ConsumerState<Profile> createState() => _ProfileState();
}
class _ProfileState extends ConsumerState<Profile> {
  List Iconss=[
    Icon(Icons.person),
    Icon(Icons.currency_exchange),
    Icon(Icons.phone_in_talk_rounded),
    Icon(Icons.notifications_active_sharp),
    Icon(Icons.share),
    Icon(Icons.info_outline),
    Icon(Icons.logout),
    Icon(Icons.star_border),
  ];
  List Texts=[
    "My Account",
    "My Subscription",
    "Contact Us",
    "Reminder",
    "Share Skoulknob",
    "About Us",
    "Log Out",
    "Rate Us",
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(scrWidth*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
        child: Icon(Icons.arrow_back,)),
          SizedBox(height: scrWidth*0.05,),

          Expanded(
            child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccount()));
                          break;
                        case 1:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Subscription()));
                          break;

                        case 2:
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs(),));
                          break;
                        case 3:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Reminder(),));
                          break;
                          break;
                        case 4:
                          print("Case 4");
                          break;
                          break;
                        case 5:
                          print("Case 5");
                          break;
                          break;
                        case 6:
                          print("Case 6");
                          break;
                          break;
                        case 7:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RateUs(),));
                          break;

                      // Add cases for other options

                        default:
                          break;
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: scrWidth*0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Iconss[index],
                              SizedBox(width: scrWidth*0.03,),
                              Text(Texts[index],style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: scrWidth*0.03),)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.keyboard_arrow_right_rounded)
                            ],
                          )

                        ],
                      ),
                    ),
                  );
                },),
          )



          ],
        ),
      ),
      ),
    );
  }
}



class MyAccount extends ConsumerStatefulWidget {
  const MyAccount({super.key});

  @override
  ConsumerState<MyAccount> createState() => _MyAccountState();
}
class _MyAccountState extends ConsumerState<MyAccount> {
  TextEditingController nicknameController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController dobController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Padding(
          padding: EdgeInsets.all(scrWidth*0.03),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,)),
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text("Save",style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 15,color: MyColors.primaryColor),))
                  ],
                ),
                SizedBox(height: scrWidth*0.035,),
                Text("Nick Name", style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600,),),
                TextFormField(
                  controller: nicknameController,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 15),  // Customize the entered text style
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: scrWidth*0.06),  // This removes the default padding
                    suffixIcon: Icon(Icons.edit),
                  ),
                ),
                SizedBox(height: scrWidth*0.035,),
                Text("Age",style: GoogleFonts.inter(fontSize: 13,fontWeight: FontWeight.w600),),
                TextFormField(
                  controller: ageController,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 15),  // Customize the entered text style
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: scrWidth*0.06),  // This removes the default padding
                    suffixIcon: Icon(Icons.edit),
                  ),
                ),
                SizedBox(height: scrWidth*0.035,),
                Text("Phone Number",style: GoogleFonts.inter(fontSize: 13,fontWeight: FontWeight.w600),),
                TextFormField(
                  controller: phoneController,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 15),  // Customize the entered text style
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: scrWidth*0.06),  // This removes the default padding
                    suffixIcon: Icon(Icons.edit),
                  ),
                ),
                SizedBox(height: scrWidth*0.035,),
                Text("Date Of Birth",style: GoogleFonts.inter(fontSize: 13,fontWeight: FontWeight.w600),),
                TextFormField(
                  controller: dobController,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 15),  // Customize the entered text style
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: scrWidth*0.06),  // This removes the default padding
                    suffixIcon: Icon(Icons.edit),
                  ),
                ),
                SizedBox(height: scrWidth*0.035,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}



class Subscription extends ConsumerStatefulWidget {
  const Subscription({super.key});
  @override
  ConsumerState<Subscription> createState() => _SubscriptionState();
}
class _SubscriptionState extends ConsumerState<Subscription> {
  @override
  Widget build(BuildContext context) {
    final subscription = ref.watch(subscriptionProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(scrWidth*0.03),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: scrHeight*0.1,),
                Stack(
                  children: [
                    Center(child: Container(
                        height: scrHeight*0.8,
                        width: scrWidth*1,
                        color: Colors.white,)),
                    Positioned(
                        child: Container(
                          height: scrHeight*0.3,
                          width: scrWidth*1,
                          color: Colors.white,
                          child: SvgPicture.asset("assets/Subscription.svg",height: scrHeight*0.3,width: scrWidth*0.4),
                        )
                    ),
                    Positioned(
                      top: scrHeight*0.2,
                        child: Container(
                          height: scrHeight*0.53,
                          width: scrWidth*0.936,
                          decoration: BoxDecoration(
                            color:Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(scrHeight*0.03)
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: scrWidth*0.06,),
                              Text("Unlock Soul Knob Premium",style: GoogleFonts.inter(fontSize: scrWidth*0.042,fontWeight: FontWeight.w700),),
                              Text("AI integrated Mentor Chat can",style: GoogleFonts.inter(fontSize: scrWidth*0.032,fontWeight: FontWeight.w400),),
                              Text("Accessed After Subscription Only",style: GoogleFonts.inter(fontSize: scrWidth*0.032,fontWeight: FontWeight.w400),),
                              SizedBox(height: scrWidth*0.06,),
                              InkWell(
                                onTap: () {
                                  ref.read(subscriptionProvider.notifier).state = !subscription;
                                },
                                child: Container(
                                  height:scrHeight*0.1,
                                  width: scrWidth*0.7,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(scrWidth*0.03),
                                    border: subscription?Border.all(color: Color(0xff1C6BFF)):Border.all(color: Colors.white)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: scrWidth*0.03,right: scrWidth*0.03),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Monthly",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.032),),
                                        Text("\$200",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize:scrWidth*0.042),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: scrWidth*0.04,),
                              InkWell(
                                onTap: () {
                                  ref.read(subscriptionProvider.notifier).state = !subscription;
                                },
                                child: Container(
                                  height:scrHeight*0.1,
                                  width: scrWidth*0.7,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(scrWidth*0.03),
                                      border: subscription?Border.all(color:Colors.white):Border.all(color: Color(0xff1C6BFF))

                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: scrWidth*0.03,right: scrWidth*0.03),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Yearly",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.032),),
                                        Text("\$300",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize:scrWidth*0.042),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: scrWidth*0.08,),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: scrHeight*0.055,
                                  width: scrWidth*0.7 ,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE15145),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(child: Text("Unlock",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.04,color: Colors.white))),
                                ),
                              ),
                            ],
                          ),
                        )
                    )
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



class ContactUs extends ConsumerStatefulWidget {
  const ContactUs({super.key});

  @override
  ConsumerState<ContactUs> createState() => _ContactUsState();
}
class _ContactUsState extends ConsumerState<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Padding(
          padding: EdgeInsets.all(scrWidth*0.03),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back,)),
                SizedBox(height: scrHeight*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.email_outlined,color: Colors.black54),
                    SizedBox(width: scrWidth*0.03,),
                    Text("serinjohnson57@gmail.com",style: GoogleFonts.inter(fontSize: scrWidth*0.03,fontWeight: FontWeight.w400),)
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




class Reminder extends ConsumerStatefulWidget {
  const Reminder({super.key});

  @override
  ConsumerState<Reminder> createState() => _ReminderState();
}
class _ReminderState extends ConsumerState<Reminder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Padding(
          padding: EdgeInsets.all(scrWidth*0.03),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back,)),
                SizedBox(height: scrHeight*0.02,),
                Container(
                  height: scrHeight*1,
                  width: scrWidth*1,
                  child: ListView.builder(
                    itemCount: 2,
                    physics: BouncingScrollPhysics(),
                    itemBuilder:(context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: scrWidth*0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: scrWidth*0.072,
                                  backgroundImage:AssetImage("assets/doctorpng.png") ,
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("First Logic",style:GoogleFonts.outfit(fontWeight: FontWeight.w400,fontSize: 15),),
                                    Text("Yea sure, i just needed some time !",style:GoogleFonts.outfit(fontWeight: FontWeight.w400,fontSize: 9.5),),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text("9:00 AM",style:GoogleFonts.outfit(fontWeight: FontWeight.w400,fontSize: scrWidth*0.02,color: Color(0xffE01F24))),
                                CircleAvatar(
                                  radius: scrWidth*0.02,
                                  backgroundColor: Color(0xffE01F24),
                                  child: Center(child: Text("2",style:TextStyle(color: Colors.white,fontSize: scrWidth*0.02) )),
                                )
                              ],
                            )

                          ],
                        ),
                      );
                    },
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}



class RateUs extends ConsumerStatefulWidget {
  const RateUs({super.key});
  @override
  ConsumerState<RateUs> createState() => _RateUsState();
}
class _RateUsState extends ConsumerState<RateUs> {

    double rating = 0;
  void updateRating(double value) {
    setState(() {
      rating = value;
      print(rating);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Padding(
          padding: EdgeInsets.all(scrWidth*0.03),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back,)),
                SizedBox(height: scrHeight*0.02,),
                Text("Rate Us",style:GoogleFonts.inter(fontSize: 13,fontWeight: FontWeight.w700),),
                SizedBox(height: scrHeight*0.07,),
                Center(
                  child:  PannableRatingBar(
                        rate: rating,
                        onChanged: updateRating,
                        spacing: 10,
                        items: List.generate(
                               5,
                            (index) => const RatingWidget(
                            selectedColor: Colors.yellow,
                            unSelectedColor: Colors.grey,
                           child: Icon(
                              Icons.star,
                                size: 30,
                                    ),
                          ),
                      ),
                ),
                ),
                SizedBox(height: scrWidth*0.25,),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: scrWidth*0.12,
                    width: scrWidth*1,
                    decoration: BoxDecoration(
                        color: Color(0xFFE15145),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("Rate Us",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: scrWidth*0.04,color: Colors.white))),
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




