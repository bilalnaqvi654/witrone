import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wiretronoriginal/constants.dart';
import 'package:wiretronoriginal/pages/sub_pages/contactUs.dart';

class TicketPage extends StatefulWidget {
  final String title = "Wire Tron";
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  bool checkBoxValue = false;
  bool checkBoxValuee = false;
  String name;
  String address;
  String phone;
  String prob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.color_primary),
        title: Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text(
              "Create Ticket",
              style: TextStyle(
                  color: AppColors.color_primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )),
        backgroundColor: AppColors.chat_bg,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 75, left: 10),
              child: SizedBox(
                width: 250,
                child: TextField(
                  onChanged: (val) {
                    name = val;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: 'Name',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: SizedBox(
                width: 250,
                child: TextField(
                  onChanged: (val) {
                    address = val;
                  },
                  maxLines: 4,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: 'Address',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: SizedBox(
                width: 250,
                child: TextField(
                  onChanged: (val) {
                    phone = val;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: 'Phone No',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: SizedBox(
                width: 250,
                child: TextField(
                  onChanged: (val) {
                    prob = val;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: 'Problem',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0))),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 40,
                ),
                child: Row(
                  children: <Widget>[
                    new Checkbox(
                        value: checkBoxValue,
                        activeColor: Colors.green,
                        onChanged: (bool newValue) {
                          setState(() {
                            checkBoxValue = newValue;
                          });
                        }),
                    Text(
                      'Issue Resolve?',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: new Checkbox(
                          value: checkBoxValuee,
                          activeColor: Colors.green,
                          onChanged: (bool newValue) {
                            setState(() {
                              checkBoxValuee = newValue;
                            });
                          }),
                    ),
                    Text(
                      'Not Resolved',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: FlatButton(
                  child: Text('Generate Ticket',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Arial",
                      )),
                  onPressed: () async {
                    await SaveDataToFirebase();
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.verified_rounded),
                                      Text("Ticket Created")
                                    ],
                                  ),
                                ),
                              ],
                            ));
                  },
                  splashColor: AppColors.color_secondary,
                  color: AppColors.color_secondary,
                  height: 40,
                  minWidth: 150,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color.fromRGBO(0, 136, 255, 1)),
                      borderRadius: BorderRadius.circular(50))),
            )
          ],
        ),
      ),
    );
  }

  void SaveDataToFirebase() async {
    FirebaseFirestore.instance.collection('Tickets').add({
      "Name": name,
      "Address": address,
      "PhoneNumber": phone,
      "Problem": prob,
    }).then((_) => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TicketPage(),
            ),
          ),
        });
  }
}
