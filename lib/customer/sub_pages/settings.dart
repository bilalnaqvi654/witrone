import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wiretronoriginal/constants.dart';
import 'package:wiretronoriginal/customer/sub_pages/location.dart';
import 'package:wiretronoriginal/customer/sub_pages/payment.dart';
import 'package:wiretronoriginal/pages/sub_pages/contactUs.dart';
import 'package:wiretronoriginal/pages/sub_pages/editProfile.dart';
import 'package:wiretronoriginal/pages/sub_pages/profile.dart';

class SettingsPage extends StatefulWidget {
  final String title = "Wire Tron";
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(
              top: 20,left: 15,
            ),
            child: SizedBox(
              width: 380,
              height: 75,
              child: Card(
                child: FlatButton(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/avatar.png",
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                        ),
                        child: Text(
                          "Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.color_primary,
                              fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                ),
                elevation: 5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,left: 15,
            ),
            child: SizedBox(
              width: 380,
              height: 75,
              child: Card(
                child: FlatButton(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/dollor.png",
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                        ),
                        child: Text(
                          "Payment",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.color_primary,
                              fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentPage()),
                    );
                  },
                ),
                elevation: 5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,left: 15,
            ),
            child: SizedBox(
              width: 380,
              height: 75,
              child: Card(
                child: FlatButton(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/aboutus.png",
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                        ),
                        child: Text(
                          "About Us",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.color_primary,
                              fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/about-us');
                  },
                ),
                elevation: 5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,left: 15,
            ),
            child: SizedBox(
              width: 380,
              height: 75,
              child: Card(
                child: FlatButton(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/contactus.png",
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                        ),
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.color_primary,
                              fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactPage()),
                    );
                  },
                ),
                elevation: 5,
              ),
            ),
          ),

          /*Padding(
            padding: const EdgeInsets.only(top: 25,left: 250),
            child: SizedBox(
              width: 100,
              height: 35,
              child: FlatButton(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 0,
                      ),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color.fromRGBO(172, 31, 31, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
