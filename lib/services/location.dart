import 'dart:io';
import 'package:geolocator/geolocator.dart';
class LocationHandle {
  late double latitude = 0;
  late double longitude = 0;
  Future<void> getCurrentLocation () async {
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      latitude = position.latitude;
      longitude = position.longitude;
    }catch(e) {
      print(e);
    }
  }
}