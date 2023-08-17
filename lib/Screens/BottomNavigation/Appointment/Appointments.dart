import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Appointemnts extends StatefulWidget {
  const Appointemnts({super.key});

  @override
  State<Appointemnts> createState() => _AppointemntsState();
}
var width;
var height;
List<String> Doctors=[
  "Serin",
  "John",
  "Shafeel",
  "Abu",
  "Anusha",
  "Anshid",
];
List<String> Category=[
  "Pediatrician",
  "Cardiologist",
  "Gastroenterologist",
  "Pulmonologist",
  "Nephrologist",
  "Endocrinologist",
];
List<String> Hospital=[
  "Allied Health Services",
  "Care Medical Clinic",
  "Community Health Service",
  "Diagnostic Center",
  "Express Laboratory",
  "Family Health Hospital",
];



class _AppointemntsState extends State<Appointemnts> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(width*0.035),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Find Your Desired",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.06),),
                        Text("Consultant",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.06),)

                      ],
                    ),
                    SvgPicture.asset("assets/appointment_logo].svg")
                  ],
                ),
                SizedBox(
                  height: width*0.03,
                ),
                Container(
                  height: width*0.12,
                  width: width*1.3,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(10)
                ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search For Doctors",
                      prefixIcon: Icon(Icons.search,size: width*0.07),
                      border: InputBorder.none

                    ),
                  ),
                ),
                SizedBox(
                  height: width*0.03,
                ),
                Container(
                  height: width*2,
                  width: width*1,
                  child: ListView.builder(
                    itemCount: Doctors.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: width*0.03),

                      width: width*1,
                      height: width*0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:Color(0xFFF2F2F2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/Login.svg",height: width*0.25,width: width*0.25,fit: BoxFit.cover,),
                              SizedBox(width: width*0.04,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Doctors[index],style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.w500),),
                                  SizedBox(height: width*0.02,),
                                  Text(Category[index],style: TextStyle(fontSize: width*0.035,fontWeight: FontWeight.w400,color: Color(0xFF727272)),),
                                  SizedBox(height: width*0.01,),
                                  Text(Hospital[index],style: TextStyle(fontSize: width*0.035,fontWeight: FontWeight.w400,color: Color(0xFF727272)),),
                                  SizedBox(height: width*0.01,),
                                  SvgPicture.asset("assets/Rating_star.svg")
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: width*0.22,
                            height: width*0.085,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFE01F24)
                            ),
                            child: Center(child: Text("Book",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: width*0.04) )),
                          )


                        ],
                      ),
                    );

                    },),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
