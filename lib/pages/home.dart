import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:wiretronoriginal/constants.dart';
import 'package:wiretronoriginal/pages/login.dart';
import 'package:wiretronoriginal/pages/register.dart';
import 'package:wiretronoriginal/widgets/logo.dart';

class HomePage extends StatelessWidget {
  final String title;
  HomePage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/cover.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Logo(
              logout: true,
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Hello There !',
                      style: TextStyle(
                          color: Color.fromRGBO(24, 59, 120, 1),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
                FlatButton(
                    child: Text('Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Arial",
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    splashColor: Colors.blueAccent,
                    color: Color.fromRGBO(0, 136, 255, 1),
                    height: 60,
                    minWidth: 200,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color.fromRGBO(0, 136, 255, 1)),
                        borderRadius: BorderRadius.circular(50))),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: FlatButton(
                        child: Text('Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Arial",
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        splashColor: Colors.blueAccent,
                        color: Color.fromRGBO(15, 35, 70, 1),
                        height: 60,
                        minWidth: 200,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromRGBO(0, 136, 255, 1)),
                            borderRadius: BorderRadius.circular(50)))),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
