import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:latlong/latlong.dart' as latLng;
import 'package:flutter_map/src/layer/marker_layer.dart' as mark;
import 'package:geolocator/geolocator.dart';
import 'package:wiretronoriginal/constants.dart';
import 'package:wiretronoriginal/customer/sub_pages/ticket.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Position myPostion;
  double lat;
  double lng;
  void getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    setState(() {
      lat = position.latitude;
      lng = position.longitude;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentPosition();
    // setState(() {
    //   lat = myPostion.latitude;
    //   lng = myPostion.latitude;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  FlutterMap(
                    mapController: MapController(),
                    options: MapOptions(
                      center: latLng.LatLng(lat, lng),
                    ),
                    layers: [
                      TileLayerOptions(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c']),
                      MarkerLayerOptions(
                        markers: [
                          mark.Marker(
                              width: 40,
                              height: 40,
                              point: latLng.LatLng(lat, lng),
                              builder: (context) => Container(
                                    child: IconButton(
                                      icon: Icon(Icons.location_on),
                                      color: Colors.red,
                                      iconSize: 45,
                                      onPressed: () {
                                        print("marker tapped");
                                      },
                                    ),
                                  ))
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
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
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(
          //   width: 450,
          //   height: 178,
          //   child: Card(
          //     color: AppColors.color_secondary,
          //     child: Column(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(top: 10, right: 240),
          //           child: Text(
          //             "4 min away",
          //             style: TextStyle(color: Colors.white),
          //           ),
          //         ),
          //         Row(
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.only(top: 10, left: 25),
          //               child: Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Container(
          //                   width: 40,
          //                   height: 40,
          //                   child: ClipRRect(
          //                     child: Image.asset('assets/icons/boy.webp'),
          //                     borderRadius:
          //                         BorderRadius.all(Radius.circular(50)),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Column(
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.only(right: 23, top: 15),
          //                   child: Text(
          //                     "Ali",
          //                     style: TextStyle(
          //                         fontSize: 15, color: AppColors.chat_bg),
          //                   ),
          //                 ),
          //                 Text(
          //                   "4.5 star",
          //                   style:
          //                       TextStyle(fontSize: 12, color: Colors.white54),
          //                 ),
          //               ],
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(left: 150),
          //               child: Row(
          //                 children: [
          //                   Padding(
          //                     padding: const EdgeInsets.only(top: 15),
          //                     child: SizedBox(
          //                         width: 45,
          //                         height: 45,
          //                         child: Card(
          //                             color: AppColors.color_primary,
          //                             child: Icon(Icons.phone,
          //                                 color: Colors.white, size: 20))),
          //                   ),
          //                   Padding(
          //                     padding: const EdgeInsets.only(top: 15),
          //                     child: SizedBox(
          //                         width: 45,
          //                         height: 45,
          //                         child: Card(
          //                             color: AppColors.color_primary,
          //                             child: Icon(Icons.email_outlined,
          //                                 color: Colors.white, size: 20))),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(top: 25),
          //           child: FlatButton(
          //               child: Text('CANCEL',
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 20,
          //                   )),
          //               onPressed: () {
          //                 Navigator.pop(context);
          //               },
          //               splashColor: AppColors.color_secondary,
          //               color: AppColors.color_primary,
          //               height: 40,
          //               minWidth: 300,
          //               shape: RoundedRectangleBorder(
          //                   side: BorderSide(
          //                       color: Color.fromRGBO(0, 136, 255, 1)),
          //                   borderRadius: BorderRadius.circular(10))),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
