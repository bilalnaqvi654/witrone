import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wiretronoriginal/constants.dart';
import 'package:wiretronoriginal/widgets/dialogue.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  String dropdownValue;
  void _register() async {
    showDialog(
        context: context,
        builder: (BuildContext context) => ProgressDialog(
              status: 'REgistering  you .. ',
            ));

    final User user = (await _auth
            .createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
            .catchError((ex) {
      Navigator.pop(context);
      Exception exception = ex;
      showSnackBar(exception.toString());
    }))
        .user;
    Navigator.pop(context);
    if (user != null) {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(_auth.currentUser.uid)
          .set({
        "Name": _usernameController.text,
        "email": _emailController.text,
      });

      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.color_primary),
        title: Padding(
            padding: EdgeInsets.only(left: 70),
            child: Text(
              "Register",
              style: TextStyle(
                  color: AppColors.color_primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )),
        backgroundColor: AppColors.chat_bg,
      ),
      body: Center(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 40),
        child: Column(
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/icons/register_icon.png',
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'Email',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0))),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: 'Username',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0))),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0))),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: FlatButton(
                    child: Text('Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Arial",
                        )),
                    onPressed: () async {
                      var conectivityResult =
                          await Connectivity().checkConnectivity();
                      if (conectivityResult != ConnectivityResult.mobile &&
                          conectivityResult != ConnectivityResult.wifi) {
                        showSnackBar('Check internet connectivity ');
                        return;
                      }
                      if (_usernameController.text.isNotEmpty &&
                          _usernameController.text.length < 4) {
                        showSnackBar('Please enter the valid name');
                        return;
                      }
                      if (_emailController.text.isNotEmpty &&
                          !_emailController.text.contains('@')) {
                        showSnackBar('Please enter the valid email');
                        return;
                      }
                      if (_passwordController.text.isNotEmpty &&
                          _passwordController.text.length < 8) {
                        showSnackBar('Please enter the valid password');
                        return;
                      }
                      await _register();
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                content: ListTile(
                                    title: Text("Registered"),
                                    subtitle: Text(
                                        'Please Verify your email to continue.')),
                                actions: [
                                  FlatButton(
                                      color: AppColors.color_primary,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.check_circle),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("OK")
                                          ],
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color.fromRGBO(
                                                  0, 136, 255, 1)),
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                ],
                              ));
                    },
                    splashColor: AppColors.color_secondary,
                    color: AppColors.color_secondary,
                    height: 40,
                    minWidth: 250,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color.fromRGBO(0, 136, 255, 1)),
                        borderRadius: BorderRadius.circular(50))))
          ],
        ),
      )),
    );
  }

  void showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      backgroundColor: Colors.red,
    );
    scaffoldkey.currentState.showSnackBar(snackBar);
  }
}
