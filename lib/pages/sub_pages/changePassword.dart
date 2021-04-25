import 'package:flutter/material.dart';
import 'package:wiretronoriginal/constants.dart';
import 'package:wiretronoriginal/pages/app.dart';
import 'package:wiretronoriginal/pages/sub_pages/editProfile.dart';
import 'package:wiretronoriginal/pages/sub_pages/jobs.dart';

class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.color_primary),
        title: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Change Password",
              style: TextStyle(
                  color: AppColors.color_primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )),
        backgroundColor: AppColors.chat_bg,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(top:50,bottom: 10),
                child: SizedBox(
                  width: 265,
                  child: Card(

                    child: FlatButton(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Current Password'
                        ),
                      ),
                      onPressed: () {},
                    ),
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  width: 265,
                  child: Card(

                    child: FlatButton(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'New Password'
                        ),
                      ),
                      onPressed: () {},
                    ),
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),


              SizedBox(
                width: 265,
                child: Card(

                  child: FlatButton(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password'
                      ),
                    ),
                    onPressed: () {},
                  ),
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),


              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: FlatButton(
                      child: Text('Change',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          )),
                      onPressed: () {},
                      splashColor: AppColors.color_secondary,
                      color: AppColors.color_secondary,
                      height: 40,
                      minWidth: 250,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color.fromRGBO(0, 136, 255, 1)),
                          borderRadius: BorderRadius.circular(50))))
            ],
          ),
        ),
      ),
    );
  }
}
