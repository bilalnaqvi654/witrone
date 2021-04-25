import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wiretronoriginal/constants.dart';

class CustomerLocationPage extends StatefulWidget {
  @override
  _CustomerLocationPageState createState() => _CustomerLocationPageState();
}

class _CustomerLocationPageState extends State<CustomerLocationPage> {
  @override
  Widget build(BuildContext context) {
    home:
    Scaffold(
      body: FireMap(),
    );
  }
}

class FireMap extends StatefulWidget {
  @override
  _FireMapState createState() => _FireMapState();
}

class _FireMapState extends State<FireMap> {
  @override
  build(context) {
    return Stack(
      children: <Widget>[
        //GoogleMap(
          //initialCameraPosition: CameraPosition(
            //target:LatLng(24.124,-110.321)
          //)
        // )
      ],
    );
  }
}
