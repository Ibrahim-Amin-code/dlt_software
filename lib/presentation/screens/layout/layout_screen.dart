// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dlt_software/presentation/screens/profile/profile_screen.dart';
import 'package:dlt_software/presentation/screens/home_page/home_page_screen.dart';
import 'package:dlt_software/presentation/screens/menu/menu_screen.dart';
import 'package:dlt_software/presentation/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';

import '../notification/notification_screen.dart';

class BottomNave extends StatefulWidget {
  final int index;
  const BottomNave({Key? key, required this.index}) : super(key: key);

  @override
  _BottomNaveState createState() => _BottomNaveState();
}

class _BottomNaveState extends State<BottomNave> {
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  int currentIndex = 0;

  List<Widget> screens = [
    const ProfileScreen(),
    const NotificationScreen(),
    const HomePageScreen(),
    const SettingsScreen(),
    const MenuScreen()
  ];
  getIndex() {
    // ignore: unnecessary_null_comparison
    if (widget.index != null) {
      setState(() {
        currentIndex = widget.index;
      });
    } else {
      setState(() {
        currentIndex = 0;
      });
    }
  }

  @override
  void initState() {
    getIndex();
    // getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return PreferredSize(
      preferredSize: Size(w, h),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xff3A0CA3).withOpacity(0.99),
              // Colors.white70,
              // Colors.white,
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: CurvedNavigationBar(
            height: h * 0.09,
            buttonBackgroundColor: Colors.white,
            color: const Color(0xff3F80B8),
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            letIndexChange: (index) => true,
            index: currentIndex,
            backgroundColor: Colors.transparent,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              Icon(
                Icons.person,
                color: (currentIndex == 0) ? Colors.blue : Colors.white,
              ),
              Icon(
                Icons.notifications,
                color: (currentIndex == 1) ? Colors.blue : Colors.white,
              ),
              Icon(
                Icons.home,
                color: (currentIndex == 2) ? Colors.blue : Colors.white,
              ),
              Icon(
                Icons.settings,
                color: (currentIndex == 3) ? Colors.blue : Colors.white,
              ),
              Icon(
                Icons.menu,
                color: (currentIndex == 4) ? Colors.blue : Colors.white,
              ),
            ],
          ),
          body: screens[currentIndex],
        ),
      ),
    );
  }
}
