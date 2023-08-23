import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soulknobe_customer/Core/local/local_variables.dart';

import 'doctor_booking.dart';


class Appointemnts extends StatefulWidget {
  const Appointemnts({super.key});

  @override
  State<Appointemnts> createState() => _AppointemntsState();
}



class _AppointemntsState extends State<Appointemnts> {
  var data;
  var doc;
  List doctors = [];
  String docName = "";
  var department;

  @override
  void initState() {
    // TODO: implement initState
    //getDoctor();
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(scrWidth * 0.035),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                  height: scrWidth * 0.03,
                ),
                SizedBox(
                    height: scrWidth * 2,
                    width: scrWidth * 1,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("doctors")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          data = snapshot.data!.docs;
                        }
                        return ListView.builder(
                          itemCount: data.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final doc = data[index];
                            final docName = doc["name"];
                            final description = doc["description"];
                            for (department in doc["department"]) {
                              print(department);
                            }

                            return Container(
                              margin: EdgeInsets.only(bottom: scrWidth * 0.03),
                              width: scrWidth * 1,
                              height: scrWidth * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFF2F2F2),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            //doctor name
                                            docName,
                                            style: TextStyle(
                                                fontSize: scrWidth * 0.05,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: scrWidth * 0.02,
                                          ),
                                          Text(
                                            //doctor department
                                            department,
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
                                          SvgPicture.asset(
                                              "assets/Rating_star.svg")
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
                                                    name: docName,
                                                    category: department,
                                                    description: description,
                                                  )));
                                    },
                                    child: Container(
                                      width: scrWidth * 0.22,
                                      height: scrWidth * 0.085,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color(0xFFE01F24)),
                                      child: Center(
                                          child: Text("Book",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: scrWidth * 0.04))),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
