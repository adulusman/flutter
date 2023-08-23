import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../Questions/Questions_Page.dart';
import '../../feature/auth/Doctor/Screen/Appointments.dart';
import 'Home/screen/Home_Page.dart';

class Navbar extends StatefulWidget {
  const Navbar({
    Key? key,
  }) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

var width;
var height;

class _NavbarState extends State<Navbar> {
  dynamic selected;

  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
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
            title: Text('Home', style: TextStyle(fontSize: width * 0.03)),
          ),
          BottomBarItem(
            icon: Icon(Icons.date_range_outlined),
            selectedColor: Colors.red,
            unSelectedColor: Colors.black54,
            title:
                Text('Appointments', style: TextStyle(fontSize: width * 0.03)),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.groups,
              ),
              selectedColor: Colors.red,
              unSelectedColor: Colors.black54,
              title: Text('Peer Groups',
                  style: TextStyle(fontSize: width * 0.03))),
          BottomBarItem(
              icon: const Icon(
                Icons.lightbulb,
              ),
              selectedColor: Colors.red,
              unSelectedColor: Colors.black54,
              title:
                  Text('Exercise', style: TextStyle(fontSize: width * 0.03))),
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
          children: [Icon(Icons.chat_bubble_outline), Text("Chat")],
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
            Questions_Page(),
            Center(child: Text('Profile')),
          ],
        ),
      ),
    );
  }
}
