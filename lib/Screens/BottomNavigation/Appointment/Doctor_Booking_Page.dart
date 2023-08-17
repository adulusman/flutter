import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Doctor_Booking extends StatefulWidget {
  const Doctor_Booking({super.key});

  @override
  State<Doctor_Booking> createState() => _Doctor_BookingState();
}
var width;
var height;
class _Doctor_BookingState extends State<Doctor_Booking> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SvgPicture.asset("assets/Doctors.svg")
          ],
        ),
      ),
    );
  }
}
