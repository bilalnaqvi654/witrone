import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wiretronoriginal/customer/sub_pages/ticket.dart';

class TicketGenrator extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;
  TicketGenrator({this.snapshot, this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Card(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        Text('Number'),
                        SizedBox(
                          width: 14.0,
                        ),
                        Text(
                          snapshot.docs[index].data()["PhoneNumber"].toString(),
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        Text('Name'),
                        SizedBox(
                          width: 14.0,
                        ),
                        Text(
                          snapshot.docs[index].data()["Name"].toString(),
                          //   style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        Text('Problem'),
                        SizedBox(
                          width: 14.0,
                        ),
                        Text(
                          snapshot.docs[index].data()["Problem"].toString(),
                          // style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Address'),
                        SizedBox(
                          width: 14.0,
                        ),
                        Text(
                          snapshot.docs[index].data()["Address"].toString(),
                          // style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  )

                  /*  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text("Complain:", style: TextStyle(
                                        fontSize: 12, color: Colors.grey),),
                                  ),*/
                ],
              ),
              /*  Padding(
                                padding: const EdgeInsets.only(left: 170),
                                child: new IconButton(
                                    icon: new Icon(Icons.call),

                                    onPressed: () {}
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: new IconButton(
                                    icon: new Icon(Icons.chat),

                                    onPressed: () {}
                                ),
                              ),*/
            ],
          ),
        ),
      ],
    );
  }
}
