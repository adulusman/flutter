

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../Core/local/local_variables.dart';

import '../../feature/Activities/Screens/Activities_main.dart';
import '../../feature/Doctor/Screen/Appointments.dart';

import '../../feature/Peer_Groups/peerGroups.dart';
import 'Home/screen/Home_Page.dart';
class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  dynamic selected;

  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          iconSize: 20,
          barAnimation: BarAnimation.fade,

          iconStyle: IconStyle.Default,
        ),
        items: [

          BottomBarItem(
            icon: Icon(
              Icons.home,
            ),
            selectedColor: Colors.red,
            unSelectedColor: Colors.black54,
            title:  Text('Home',style:GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: scrWidth*0.03)),
          ),

          BottomBarItem(
            icon:  Icon(Icons.date_range_outlined),
            selectedColor: Colors.red,
            unSelectedColor: Colors.black54,

            title:  Text('Appointments',style:GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: scrWidth*0.03)
            ),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.groups,
              ),
              selectedColor: Colors.red,
              unSelectedColor: Colors.black54,
              title:  Text('Peer Groups',style:GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: scrWidth*0.03))
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.lightbulb,
              ),
              selectedColor: Colors.red,
              unSelectedColor: Colors.black54,
              title:  Text('Activities',style:GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: scrWidth*0.03))
          ),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.chat_bubble_outline),
            Text("Chat")
          ],
        ),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: const [
            Home_Page(),
            Appointemnts(),
            PeerGroups(),
            Activities(),
          ],
        ),
      ),
    );
  }
}


