import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wiretronoriginal/customer/sub_pages/ShowTickets.dart';
import 'package:wiretronoriginal/customer/sub_pages/ticket.dart';
import 'package:wiretronoriginal/widgets/logo.dart';
import 'package:wiretronoriginal/constants.dart';

class TicketsPage extends StatefulWidget {
  final String title = "Wire Tron";

  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  var datbaseref = FirebaseFirestore.instance.collection("Tickets").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 10, left: 220),
              child: FlatButton(
                  child: Text('Create New Ticket',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Arial",
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TicketPage()),
                    );
                  },
                  splashColor: AppColors.color_primary,
                  color: AppColors.color_primary,
                  height: 30,
                  minWidth: 130,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.color_primary),
                      borderRadius: BorderRadius.circular(50)))),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: datbaseref,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, int index) {
                    return TicketGenrator(
                        snapshot: snapshot.data, index: index);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
