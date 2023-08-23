import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Core/local/local_variables.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}
class _ActivitiesState extends State<Activities> {

  List colors=[
    Color(0xffA4DDFF),
    Color(0xffFFD6D7),
    Color(0xffFABE86),
    Color(0xffFFED98),
    Color(0xff99FFC7),
    Color(0xffE2D4FF)
  ];
  List pics=[
    "assets/todo.svg",
    "assets/letter.svg",
    "assets/gratitude_letter.svg",
    "assets/polls.svg",
    "assets/games.svg",
    "assets/blis_bocx.svg"
  ];
  List texts=[
    "To-Do",
    "Letter to Self",
    "Gratitude Letter",
    "Polls",
    "Games",
    "Bliss Box"
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:Padding(
          padding: EdgeInsets.all(scrWidth*0.03),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: scrHeight*0.02,),
                Container(
                  height: scrHeight*1,
                  width: scrWidth*1,
                  color: Colors.white,
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: colors.length,
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: scrWidth*0.02,
                          mainAxisSpacing: scrWidth*0.02,
                          childAspectRatio:1.3
                      ),
                      itemBuilder:(context, index) {
                        return InkWell(
                          onTap: () {
                            switch(index){
                              case 0:
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Todo()));
                                break;
                              case 1:
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Letter_Self()));
                                break;

                              case 2:
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs(),));
                                break;

                              default:
                                break;

                            }
                          },
                          child: Container(
                            height: scrHeight*0.15,
                            width: scrWidth*0.41,
                            decoration: BoxDecoration(
                                color:colors[index],
                                borderRadius: BorderRadius.circular(scrWidth*0.02)
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(pics[index]),
                                  SizedBox(height: scrWidth*0.035,),
                                  Text(texts[index],style: GoogleFonts.inter(fontSize: 13,fontWeight: FontWeight.w700),)
                                ],
                              ),
                            ),
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




class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}
class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Padding(
          padding:  EdgeInsets.only(bottom: scrWidth*0.2),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Todo_Adding(),));
            },
             backgroundColor: Color(0xffFABC12),
            child: Center(child: Icon(Icons.add,color: Color(0xff1D1D1D),size: scrWidth*0.08,)),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(scrWidth*0.03),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: scrWidth*0.07,),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,)),
                    SizedBox(width: scrWidth*0.03,),
                    Text("Notes",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: scrWidth*0.049),),

                  ],
                ),
                SizedBox(height: scrWidth*0.04,),
                Container(
                  height: scrHeight*0.06,
                  width: scrWidth*1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(scrWidth*0.02),
                      color: Color(0xffF2F2F2)
                  ),
                  child: TextFormField(
                    style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: scrWidth*0.03),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: scrWidth*0.04),
                        hintText: "search note",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search_rounded),
                        hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: scrWidth*0.03,color: Color(0xff747474))
                    ),
                  ),
                ),
                SizedBox(height: scrWidth*0.037,),
                Container(
                  height: scrHeight*1,
                  width: scrWidth*1,
                  color: Colors.white,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        mainAxisSpacing: 13,
                        crossAxisSpacing: 9   ,
                        childAspectRatio: 0.7
                      ),
                      itemBuilder: (context, index) {
                        return Container  (
                          height: scrHeight*0.35,
                          width: scrWidth*0.44,
                          decoration: BoxDecoration(
                              color: Color(0xffF7F6D4),
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(scrWidth*0.03),bottomRight: Radius.circular(scrWidth*0.03),topRight: Radius.circular(scrWidth*0.03),topLeft: Radius.circular(scrWidth*0.03))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(scrWidth*0.026),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Lorem Hipsum",style: GoogleFonts.inter(fontSize: scrWidth*0.037,fontWeight: FontWeight.w600),),
                                    SizedBox(height: scrWidth*0.02,),
                                    Text("Create a mobile app UI Kit that provide I Kit that provide a basic notes functionality but otes functionality but otes functionality but a basic notes functionality but otes functionality but otes functionality but with some improvement There will be a choice to select what kind of notes that user needed, so the experience while taking notes can be unique based on",
                                      // overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(fontSize: scrWidth*0.03,fontWeight: FontWeight.w400),)
                                  ],
                                ),
                              ),
                              Container(
                                height: scrHeight*0.034,
                                // width: scrWidth*0.44,
                                decoration: BoxDecoration(
                                    color: Color(0xffFABC12),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(scrWidth*0.03),bottomRight: Radius.circular(scrWidth*0.03))
                                ),
                                child: Center(child: Icon(Icons.delete_outline_rounded,color: Colors.white)),

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





class Todo_Adding extends StatefulWidget {
  const Todo_Adding({super.key});

  @override
  State<Todo_Adding> createState() => _Todo_AddingState();
}
class _Todo_AddingState extends State<Todo_Adding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF7F6D4),
        body: Padding(
          padding: EdgeInsets.only(left: scrWidth*0.04,right: scrWidth*0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height:scrHeight*0.046),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back,)),
                        SizedBox(width: scrWidth*0.03,),
                        Text("Notes",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: scrWidth*0.049),),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.bookmark),
                        SizedBox(width: scrWidth*0.03,),
                        SvgPicture.asset("assets/pinning_2.svg"),
                      ],
                    )

                  ],
                ),
                SizedBox(height: scrWidth*0.04,),
                TextFormField(
                  style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: scrWidth*0.06,color: Color(0xff180E25)),
                  decoration: InputDecoration(
                    hintText: "Title Here",
                    hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: scrWidth*0.06,color: Color(0xff180E25)),
                    border: InputBorder.none

                  ),
                ),
                TextFormField(
                  maxLines: null,
                  style: GoogleFonts.inter(fontSize: scrWidth*0.03,fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    hintText: "Description Here",
                    hintStyle: GoogleFonts.inter(fontSize: scrWidth*0.03,fontWeight: FontWeight.w400),
                    border: InputBorder.none,

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




class Letter_Self extends StatefulWidget {
  const Letter_Self({super.key});

  @override
  State<Letter_Self> createState() => _Letter_SelfState();
}
class _Letter_SelfState extends State<Letter_Self> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: scrWidth*0.04,right: scrWidth*0.04),
          child: Column(
            children: [
              SizedBox(height: scrWidth*0.07,),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back,)),
                  SizedBox(width: scrWidth*0.03,),
                  Text("Letter",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: scrWidth*0.049),),

                ],
              ),
              SizedBox(height: scrWidth*0.04,),
              Container(
                height: scrHeight*0.06,
                width: scrWidth*1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(scrWidth*0.02),
                    color: Color(0xffF2F2F2)
                ),
                child: TextFormField(
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: scrWidth*0.03),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: scrWidth*0.04),
                      hintText: "search note",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search_rounded),
                      hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: scrWidth*0.03,color: Color(0xff747474))
                  ),
                ),
              ),
              SizedBox(height: scrWidth*0.06,),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: scrHeight*0.16,
                        width: scrWidth*1,
                        color: Color(0xffF7F6D4),
                        margin: EdgeInsets.only(bottom: scrHeight*0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(scrWidth*0.03),
                              child: Column(
                                children: [
                                  Text("Aug"),
                                  Text("11"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(scrWidth*0.03),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Title Here",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: scrWidth*0.045),),
                                  SizedBox(height: scrWidth*0.028), // Add some space
                                  // Text("Create a mobile app ui kit sdcds sadsad qwer ewf sfds sdfv",overflow: TextOverflow.ellipsis,
                                  //  style:GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: scrWidth*0.03) ,)
                                ],
                              ),
                            ),
                            Icon(Icons.close)

                          ],
                        ),

                      );
                    }, ),
              )




            ],
          ),
        ),
      ),
    );
  }
}



