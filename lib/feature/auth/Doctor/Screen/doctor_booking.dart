import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soulknobe_customer/Core/local/local_variables.dart';

class Doctor_Booking_page extends StatefulWidget {
  const Doctor_Booking_page(
      {super.key, required this.name, required this.category, this.hospital,this.description});
  final String? name;
  final String? category;
  final String? hospital;
  final String? description;

  @override
  State<Doctor_Booking_page> createState() => _Doctor_Booking_pageState();
}

class _Doctor_Booking_pageState extends State<Doctor_Booking_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: scrHeight * 0.23,
                  width: scrWidth * 1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/doctorpng.png"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(height: scrWidth * 0.04),
                Padding(
                  padding: EdgeInsets.only(
                      left: scrWidth * 0.04, right: scrWidth * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name.toString(),
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: scrWidth * 0.04),
                      ),
                      SizedBox(height: scrWidth * 0.01),
                      Text(
                        widget.category.toString(),
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: scrWidth * 0.037,
                            color: Color(0xff727272)),
                      ),
                      Text(
                        widget.hospital.toString(),
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: scrWidth * 0.037,
                            color: Color(0xff727272)),
                      ),
                      SizedBox(height: scrWidth * 0.04),
                      Text(
                        "Description",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: scrWidth * 0.04),
                      ),
                      SizedBox(height: scrWidth * 0.01),
                      Text(
                        widget.description.toString(),
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: scrWidth * 0.037),
                      ),
                      SizedBox(height: scrWidth * 0.04),
                      Text(
                        "Appointment",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: scrWidth * 0.04),
                      ),
                      SizedBox(height: scrWidth * 0.04),
                      EasyDateTimeLine(
                        dayProps: EasyDayProps(
                            height: 90,
                            width: 60,
                            activeBorderRadius: 30,
                            inactiveDayDecoration: BoxDecoration(
                                border: Border.all(color: Colors.white))),
                        timeLineProps: EasyTimeLineProps(),
                        headerProps: EasyHeaderProps(
                          showHeader: false,
                          // showMonthPicker: false,
                          // showSelectedDate: false
                        ),
                        initialDate: DateTime.now(),
                        activeColor: Color(0xffFF262B),
                        onDateChange: (selectedDate) {
                          //[selectedDate] the new date selected.
                        },
                      ),
                      SizedBox(height: scrWidth * 0.06),
                      Container(
                        height: scrHeight * 0.2,
                        width: scrWidth * 1,
                        color: Colors.white,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 9,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 3),
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(27),
                                  border: Border.all(color: Colors.grey)),
                              child: Center(
                                  child: Text(
                                "8am-9am",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 13),
                              )),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: scrWidth * 0.06),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: scrWidth * 0.12,
                          width: scrWidth * 1,
                          decoration: BoxDecoration(
                              color: Color(0xFFE15145),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text("Book",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: scrWidth * 0.04,
                                      color: Colors.white))),
                        ),
                      ),
                    ],
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
