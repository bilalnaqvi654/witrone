import 'dart:math';

import 'package:wiretronoriginal/Models/NearByTech.dart';

class FireHelper {
  static List<NearbyTec> nearbyhotelList = [];
  static void removeFromList(String key) {
    int index = nearbyhotelList.indexWhere((element) => element.key == key);
    nearbyhotelList.remove(index);
  }

  static void updateLocation(NearbyTec nearByHotels) {
    int index = nearbyhotelList
        .indexWhere((element) => element.key == nearByHotels.key);
    nearbyhotelList[index].latitude = nearByHotels.latitude;
    nearbyhotelList[index].longitute = nearByHotels.longitute;
  }

  static double generateRandomNumbers(int max) {
    var randomGenertor = Random();
    int randInt = randomGenertor.nextInt(max);
    return randInt.toDouble();
  }
}
