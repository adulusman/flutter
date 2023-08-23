import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Core/local/local_variables.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(scrWidth*0.035),
          child: Column(
            children: [
              Container(
                height: scrWidth*0.15,
                width: scrWidth*1,
                decoration: BoxDecoration(
                  color: Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: scrWidth*0.03,right: scrWidth*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Expert",style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w700),),
                      Icon(Icons.arrow_drop_down_sharp,)
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
