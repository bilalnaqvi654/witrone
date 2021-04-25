import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wiretronoriginal/constants.dart';
import 'package:wiretronoriginal/pages/login.dart';

class Logo extends StatelessWidget {
  final bool logout;
  Logo({this.logout});
  @override
  Widget build(BuildContext context) {
    if (logout) {
      return Padding(
        padding: const EdgeInsets.only(top: 30, left: 50),
        child: Row(children: <Widget>[
          Image.asset("assets/icons/Logo.png"),
          FlatButton(
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/icons/logout.png",
                    width: 20,
                  ),
                ],
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          )
        ]),
      );
    } else {
      return Image.asset("assets/icons/Logo.png");
    }
  }
}
