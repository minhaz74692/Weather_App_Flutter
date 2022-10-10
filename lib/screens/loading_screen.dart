import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/utilities/api_kye.dart';

ApiKey apiSecret = ApiKey();
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double yourLat = 0;
  double yourLon = 0;

  @override
  void initState(){  //When user enter this screen this function will execute
    super.initState();
    String weatherUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=$yourLat&lon=$yourLon.4179079&appid=${apiSecret.apiSectreKey}';
    NetworkHandle networkData = NetworkHandle(url: weatherUrl);
    var weatherData = networkData.getData();
    getLocation();
  }
  void getLocation () async {
    LocationHandle location = LocationHandle();
    await location.getCurrentLocation();
    yourLat = location.latitude;
    yourLon = location.longitude;

    Navigator.push(context, MaterialPageRoute(builder: (context){ return LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
