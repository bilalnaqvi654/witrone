import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wiretronoriginal/constants.dart';
import 'package:wiretronoriginal/customer/customer_app.dart';
import 'package:wiretronoriginal/pages/app.dart';
import 'package:wiretronoriginal/pages/sub_pages/jobs.dart';
import 'package:wiretronoriginal/widgets/dialogue.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String dropdownValue = "Login As";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.color_primary),
        title: Padding(
            padding: EdgeInsets.only(left: 70),
            child: Text(
              "Login",
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
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_drop_down_circle),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: AppColors.color_secondary),
                underline: Container(
                  height: 2,
                  color: AppColors.color_secondary,
                ),
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Login As', 'Field Worker', 'Customer']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: FlatButton(
                      child: Text('Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Arial",
                          )),
                      onPressed: () {
                        login();
                      },
                      splashColor: AppColors.color_secondary,
                      color: AppColors.color_secondary,
                      height: 40,
                      minWidth: 250,
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Color.fromRGBO(0, 136, 255, 1)),
                          borderRadius: BorderRadius.circular(50)))),
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    //show please wait dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => ProgressDialog(
        status: 'Logging you in',
      ),
    );

    final User user = (await _auth
            .signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
            .catchError((ex) {
      //check error and display message
      Navigator.pop(context);

      showSnackBar(ex.message);
    }))
        .user;

    if (user != null) {
      // verify login
      if (dropdownValue == "Field Worker") {
        makeAvailabel();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AppPage()));

        //AppPage
      } else if (dropdownValue == "Customer") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CustomerAppPage())); //CustomerAppPage
      }
    }
  }

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

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

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Position position;
  void setupPOstionLocator() async {
    //  LocationPermission permission = await Geolocator.requestPermission();

    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentposition = position;
      print(currentposition.latitude);
    });
  }

  void initState() {
    super.initState();

    setupPOstionLocator();
  }

  void makeAvailabel() {
    Geofire.initialize('PeopleAvailable');
    Geofire.setLocation(
      new DateTime.now().millisecondsSinceEpoch.toString(),
      currentposition.latitude,
      currentposition.longitude,
    );
  }
}
