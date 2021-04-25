import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppColors {
  static const color_primary = Color.fromRGBO(15, 35, 70, 1);
  static const color_secondary = Color.fromRGBO(76, 171, 255, 1);
  static const icons_color_primary = Color.fromRGBO(165, 164, 191, 1);
  static const chat_bg = Color.fromRGBO(242, 242, 242, 1);
}

String mapKey = 'AIzaSyCx9LKQSyVaw3ITkw6z79ur2d5x1dZetP0';
Position currentposition;
final CameraPosition kGooglePlex = CameraPosition(
  target: LatLng(33.741055, 72.783985),
  zoom: 14.4746,
);
