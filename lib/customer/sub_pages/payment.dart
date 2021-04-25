
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wiretronoriginal/constants.dart';

class PaymentPage extends StatefulWidget {
  final String title = "Wire Tron";
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool checkBoxValue = false;
  bool checkBoxValuee = false;
  final _sendMessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        iconTheme: IconThemeData(color: AppColors.color_primary),
        title: Padding(
            padding: EdgeInsets.only(left: 90),
            child: Text(
              "Payment",
              style: TextStyle(
                  color: AppColors.color_primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )
        ),
        backgroundColor: AppColors.chat_bg,
      ),
      body:  SingleChildScrollView(
        child: Column(
            children: [
              Row(
                children: [

                    Expanded(
                      child: SizedBox(
                        width: 411,
                        height: 70,
                        child: Card(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Amount",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: AppColors.color_primary),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 200),
                                child: Text("5000.00 USD"),
                              ),
                            ],

                          ),

                        ),
                        
                      ),
                    ),

                  ],
                ),
              Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left:20,top:10),
                    child: Text("Please Select Your Reffered Payment Method"),
                  )
                ],
              ),

              Container(
                padding: EdgeInsets.all(0),
                child: Padding(
                  padding: const EdgeInsets.only(top:30,left: 40,),
                  child: Row(
                    children: <Widget>[
                      new Checkbox(
                          value: checkBoxValue,
                          activeColor: Colors.green,
                          onChanged: (bool newValue) {
                            setState(() {
                              checkBoxValue = newValue;
                            }
                            );
                          }
                      ),
                      Image.asset("assets/icons/paypal.png" ,width: 70,),
                      Padding(
                        padding: const EdgeInsets.only(left:40),
                        child: new Checkbox(
                            value: checkBoxValuee,
                            activeColor: Colors.green,
                            onChanged: (bool newValue) {
                              setState(() {
                                checkBoxValuee = newValue;
                              }
                              );
                            }
                        ),
                      ),
                        Image.asset("assets/icons/stripe.jpg",width: 70,),

                    ],

                  ),

                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 40,right: 20,top:20),
                child: Card(

                  child: FlatButton(

                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,

                          labelText: 'First Name'
                      ),
                    ),

                    onPressed: () {},
                  ),
                  elevation: 5,

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 20,top:20),
                child: Card(

                  child: FlatButton(

                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,

                          labelText: 'Last Name'
                      ),
                    ),

                    onPressed: () {},
                  ),
                  elevation: 5,

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 20,top:20),
                child: Card(

                  child: FlatButton(

                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'CardHolder'
                      ),
                    ),

                    onPressed: () {},
                  ),
                  elevation: 5,

                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:30,left: 80),
                    child: FlatButton(
                        child: Text('Cancel',
                            style: TextStyle(
                              color: AppColors.color_primary,
                              fontSize: 20,
                              fontFamily: "Arial",
                            )),
                        onPressed: () {
                          Navigator.pushNamed(context, '/setting');
                        },
                        splashColor: AppColors.color_secondary,
                        height: 40,
                        minWidth: 110,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color.fromRGBO(0, 136, 255, 1)),
                            borderRadius: BorderRadius.circular(10))
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:30,left:20),
                    child: FlatButton(
                        child: Text('Proceed',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Arial",
                            )),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        splashColor: AppColors.color_secondary,
                        color: AppColors.color_secondary,
                        height: 40,
                        minWidth: 110,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color.fromRGBO(0, 136, 255, 1)),
                            borderRadius: BorderRadius.circular(10))
                    ),
                  )
                ],
              )

            ],
          ),
      ),
      );
  }
  void _sendMessage(){
    _sendMessageController.clear();
  }
}
