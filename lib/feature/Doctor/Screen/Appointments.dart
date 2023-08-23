import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soulknobe_customer/Core/Constants/size.dart';
import 'package:soulknobe_customer/Core/local/local_variables.dart';
import 'package:soulknobe_customer/feature/Doctor/Controller/controller.dart';

import 'doctor_booking.dart';

class Appointemnts extends ConsumerWidget {
  Appointemnts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Find Your Desired",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: scrWidth * 0.06),
                        ),
                        Text(
                          "Consultant",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: scrWidth * 0.06),
                        )
                      ],
                    ),
                    SvgPicture.asset("assets/appointment_logo].svg")
                  ],
                ),
                SizedBox(
                  height: scrWidth * 0.03,
                ),
                Container(
                  height: scrWidth * 0.12,
                  width: scrWidth * 1.3,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Search For Doctors",
                        prefixIcon: Icon(Icons.search, size: scrWidth * 0.07),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: scrWidth * 0.05,
                ),
                // SizedBox(
                //   height: scrWidth * 2,
                //   width: scrWidth * 1,
                // ),
                // final doctorDetail =
                //     ref.watch(doctorControllerProvider
                //     );
                Consumer(builder: (context, ref, child) {
                  print('object');
                  final doctorList = ref.watch(doctorListcontroller);
                  return doctorList.when(
                    data: (data) {
                      return ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          
                          print(data[index].name);
                          final doctorModel = data[index];
                          final doctorName = data[index].name;
                          final discription = data[index].description;
                          final department = data[index].department;
                          //final description = doctorModel.description;
                          // for (department in doc["department"]) {}
          
                          return Container(
                            margin: EdgeInsets.only(bottom: scrWidth * 0.03),
                            width: scrWidth * 1,
                            height: scrWidth * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFF2F2F2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/Login.svg",
                                        height: scrWidth * 0.25,
                                        width: scrWidth * 0.25,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: scrWidth * 0.04,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            //doctor name
                                            doctorName.toString(),
                                            style: TextStyle(
                                                fontSize: scrWidth * 0.05,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: scrWidth * 0.02,
                                          ),
                                          Text(
                                            //doctor department
                                            department!.first,
                                            //department,
                                            style: TextStyle(
                                                fontSize: scrWidth * 0.035,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF727272)),
                                          ),
                                          SizedBox(
                                            height: scrWidth * 0.01,
                                          ),
                                          Text(
                                            "hospital",
                                            style: TextStyle(
                                                fontSize: scrWidth * 0.035,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF727272)),
                                          ),
                                          SizedBox(
                                            height: scrWidth * 0.01,
                                          ),
                                          SvgPicture.asset("assets/Rating_star.svg")
                                        ],
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Doctor_Booking_page(
                                                    doctorModel: data[index],
                                                  )));
                                    },
                                    child: Container(
                                      width: scrWidth * 0.20,
                                      height: scrWidth * 0.085,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: const Color(0xFFE01F24)),
                                      child: Center(
                                          child: Text("Book",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: scrWidth * 0.04))),
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    error: (Object error, StackTrace stackTrace) {
                      return Text(error.toString());
                    },
                    loading: () => Text(" "),
                  );
          
                 
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
