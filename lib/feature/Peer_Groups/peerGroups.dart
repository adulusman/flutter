import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Core/local/local_variables.dart';

class PeerGroups extends StatefulWidget {
  const PeerGroups({super.key});

  @override
  State<PeerGroups> createState() => _PeerGroupsState();
}

class _PeerGroupsState extends State<PeerGroups> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: scrWidth*0.03,right:scrWidth*0.03),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text("Groups",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 14),),
                SizedBox(height: 20,),
                Container(
                  height: scrHeight*1,
                  width: scrWidth*1,
                  child: ListView.builder(
                      itemCount: 6,
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
                              Row(
                                children: [
                                  Text("9:00 AM",style:GoogleFonts.outfit(fontWeight: FontWeight.w400,fontSize: 7.6,color: Color(0xffE01F24)))
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
