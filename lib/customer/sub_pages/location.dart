import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wiretronoriginal/FileHlper.dart';
import 'package:wiretronoriginal/Models/NearByTech.dart';
import 'package:wiretronoriginal/constants.dart';
import 'package:wiretronoriginal/customer/sub_pages/ticket.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  @override
  Set<Marker> HotelMarker;
  void initState() {
    super.initState();
    HotelMarker = Set<Marker>();
  }

  bool ishotelAvailable = false;

  BitmapDescriptor nearbyIcon;

  void startGeofire() {
    Geofire.initialize('PeopleAvailable');
    Geofire.queryAtLocation(
      currentposition.latitude,
      currentposition.longitude,
      20,
    ).listen((map) {
      print(map);
      if (map != null) {
        var callBack = map['callBack'];

        //latitude will be retrieved from map['latitude']
        //longitude will be retrieved from map['longitude']

        switch (callBack) {
          case Geofire.onKeyEntered:
            NearbyTec nearbyTec = NearbyTec();
            nearbyTec.key = map['key'];
            nearbyTec.longitute = map['longitude'];
            nearbyTec.latitude = map['latitude'];
            FireHelper.nearbyhotelList.add(nearbyTec);
            if (ishotelAvailable) {
              setState(() {
                updateHotelsOnMap();
              });
            }

            break;

          case Geofire.onKeyExited:
            FireHelper.removeFromList(map['key']);

            updateHotelsOnMap();
            break;

          case Geofire.onKeyMoved:
            NearbyTec nearByHotels = NearbyTec();
            nearByHotels.key = map['key'];
            nearByHotels.longitute = map['longitude'];
            nearByHotels.latitude = map['latitude'];
            FireHelper.updateLocation(nearByHotels);
            updateHotelsOnMap();
            // Update your key's location
            break;

          case Geofire.onGeoQueryReady:
            // All Intial Data is loaded
            ishotelAvailable = true;
            updateHotelsOnMap();
            print('firehelper length :${FireHelper.nearbyhotelList.length}');

            break;
        }
      }
    });
  }

  double mappadding = 0;
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  void setupPOstionLocator() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentposition = position;
    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cp = new CameraPosition(target: pos, zoom: 14.0);
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(cp),
    );
    startGeofire();
  }

  updateHotelsOnMap() {
    for (NearbyTec nearByHotels in FireHelper.nearbyhotelList) {
      LatLng hotelsPostions =
          LatLng(nearByHotels.latitude, nearByHotels.longitute);

      Marker thismarker = Marker(
        markerId:
            MarkerId('${new DateTime.now().millisecondsSinceEpoch.toString()}'),
        position: hotelsPostions,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        rotation: 90.0,
        //FireHelper.generateRandomNumbers(360),
        //infoWindow: InfoWindow(title: '$name'),
      );
      setState(() {
        HotelMarker.add(thismarker);
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: kGooglePlex,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            markers: HotelMarker,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              mapController = controller;
              setState(() {
                mappadding = (Platform.isAndroid) ? 250 : 270;
              });
              setupPOstionLocator();
            },
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
    );
  }
}
