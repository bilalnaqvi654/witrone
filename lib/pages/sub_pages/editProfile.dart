import 'package:flutter/material.dart';
import 'package:wiretronoriginal/constants.dart';
import 'package:wiretronoriginal/pages/app.dart';
import 'package:wiretronoriginal/pages/sub_pages/editProfile.dart';
import 'package:wiretronoriginal/pages/sub_pages/jobs.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.color_primary),
        title: Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text(
              "Edit Profile",
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
                  padding: EdgeInsets.only(bottom: 15),
                  child: FlatButton(
                      child: Text('Change Profile Picture',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                      onPressed: () {},
                      splashColor: AppColors.color_secondary,
                      color: AppColors.color_primary,
                      height: 40,
                      minWidth: 250,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color.fromRGBO(0, 136, 255, 1)),
                          borderRadius: BorderRadius.circular(50)))),
              SizedBox(
                width: 265,
                child: Card(

                  child: FlatButton(
                      child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Edit Name'
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
                      child: Text('Edit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Arial",
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
