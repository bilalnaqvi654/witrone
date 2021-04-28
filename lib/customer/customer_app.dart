import 'package:flutter/material.dart';
import 'package:wiretronoriginal/customer/sub_pages/location.dart';
import 'package:wiretronoriginal/customer/sub_pages/ticket.dart';
import 'package:wiretronoriginal/widgets/logo.dart';

import 'package:wiretronoriginal/routes.dart';
import 'sub_pages/tickets.dart';
import 'sub_pages/chat.dart';
import 'sub_pages/settings.dart';
import 'sub_pages/attendance.dart';
import 'package:wiretronoriginal/constants.dart';

class CustomerAppPage extends StatefulWidget {
  final String title = "Wire Tron";
  @override
  _CustomerAppPageState createState() => _CustomerAppPageState();
}

class _CustomerAppPageState extends State<CustomerAppPage> {
  final PageController pageController = new PageController(initialPage: 0);
  List<Widget> get _pages =>
      [Home(), TicketsPage(), ChatPage(), SettingsPage()];
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12)),
          child: BottomAppBar(
            color: AppColors.color_primary,
            child: Row(
              children: <Widget>[
                FlatButton(
                  splashColor: Colors.blue,
                  child: Row(
                    children: [
                      Icon(Icons.home,
                          size: 22, color: Color.fromRGBO(165, 164, 191, 1)),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text("Home",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromRGBO(165, 164, 191, 1))),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _currentPage = 0;
                    pageController.animateToPage(_currentPage,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  },
                ),
                FlatButton(
                  splashColor: Colors.blue,
                  child: Row(
                    children: [
                      Icon(Icons.account_tree,
                          size: 22, color: Color.fromRGBO(165, 164, 191, 1)),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text("Ticket",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromRGBO(165, 164, 191, 1))),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _currentPage = 1;
                    pageController.animateToPage(_currentPage,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  },
                ),
                FlatButton(
                  splashColor: Colors.blue,
                  child: Row(
                    children: [
                      Icon(Icons.forum,
                          size: 22, color: Color.fromRGBO(165, 164, 191, 1)),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text("Chat",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromRGBO(165, 164, 191, 1))),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _currentPage = 2;
                    pageController.animateToPage(_currentPage,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  },
                ),
                FlatButton(
                  splashColor: Colors.blue,
                  child: Row(
                    children: [
                      Icon(Icons.settings,
                          size: 22, color: Color.fromRGBO(165, 164, 191, 1)),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text("Settings",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromRGBO(165, 164, 191, 1))),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _currentPage = 3;
                    pageController.animateToPage(_currentPage,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
