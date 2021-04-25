import 'package:flutter/material.dart';
import 'package:wiretronoriginal/constants.dart';
import 'package:wiretronoriginal/pages/app.dart';
import 'package:wiretronoriginal/pages/sub_pages/jobs.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

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
              "Contact Us",
              style: TextStyle(
                  color: AppColors.color_primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )
        ),
        backgroundColor: AppColors.chat_bg,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[



              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: Card(

                    child: FlatButton(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ), // icon is 48px widget.
                            ),

                            labelText: 'Phone No'
                        ),
                      ),
                      onPressed: () {},
                    ),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: Card(

                    child: FlatButton(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ), // icon is 48px widget.
                            ),

                            labelText: 'Email'
                        ),
                      ),
                      onPressed: () {},
                    ),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: Card(

                    child: FlatButton(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(
                                Icons.access_time,
                                color: Colors.grey,
                              ),
                            ),
                            labelText: 'Query'
                        ),
                      ),
                      onPressed: () {},
                    ),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),


              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: FlatButton(
                      child: Text('Submit',
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
