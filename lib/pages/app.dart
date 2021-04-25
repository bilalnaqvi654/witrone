import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:wiretronoriginal/customer/sub_pages/chat.dart';

import 'package:wiretronoriginal/routes.dart';
import 'package:wiretronoriginal/widgets/logo.dart';
import 'sub_pages/jobs.dart';
import 'sub_pages/settings.dart';
import 'sub_pages/attendance.dart';
import 'package:wiretronoriginal/constants.dart';

class AppPage extends StatefulWidget {
  final String title = "Wire Tron";
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  List<Widget> get _pages =>
      [JobsPage(), ChatPage(), AttendancePage(), SettingsPage()];
  int _currentPage = 0;
  final PageController pageController = new PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar here
      body: Column(
        children: [
          Logo(
            logout: true,
          ),
          Expanded(
            child: PageView.builder(
              itemCount: _pages.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (_, index) => _pages[index],
              controller: pageController,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: AppColors.color_primary,
        selectedIndex: _currentPage,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _currentPage = index;
          pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),

        curve: Curves.easeInCirc,
        iconSize: 24,
        animationDuration: Duration(milliseconds: 400),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            icon: Icon(Icons.group,
                size: 22, color: Color.fromRGBO(165, 164, 191, 1)),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey[800],
          ),
          BottomNavyBarItem(
            title: Text(
              'Chat ',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            icon: Icon(Icons.forum,
                size: 22, color: Color.fromRGBO(165, 164, 191, 1)),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey[800],
          ),
          BottomNavyBarItem(
            activeColor: Colors.blue,
            inactiveColor: Colors.grey[800],
            title: Text(
              'Attendence',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            icon: Icon(Icons.wysiwyg,
                size: 22, color: Color.fromRGBO(165, 164, 191, 1)),
          ),
          BottomNavyBarItem(
            activeColor: Colors.blue,
            inactiveColor: Colors.grey[800],
            title: Text(
              'Setting',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            icon: Icon(Icons.settings,
                size: 22, color: Color.fromRGBO(165, 164, 191, 1)),
          ),
        ],
      ),
    );
  }
}
