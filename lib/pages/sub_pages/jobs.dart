import 'package:flutter/material.dart';
import 'package:wiretronoriginal/customer/sub_pages/chat.dart';

class JobsPage extends StatefulWidget {
  final String title = "Wire Tron";
  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                SizedBox(
                  height: 100,
                  width: 500,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Card(
                        child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: new IconButton(
                            icon: new Icon(
                              Icons.account_circle,
                              size: 50,
                            ),
                            onPressed: () {}),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "House #:",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ),
                          Text("...."),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Complain:",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: new IconButton(
                            icon: new Icon(Icons.call), onPressed: () {}),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: new IconButton(
                            icon: new Icon(Icons.chat),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatPage()),
                              );
                            }),
                      ),
                    ])),
                  ),
                ),
              ]);
            }));
  }
}
