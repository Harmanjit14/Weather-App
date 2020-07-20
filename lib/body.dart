import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:weather_widget/WeatherWidget.dart';
import 'package:weather_widget/example/main.dart';

void getLocation() async {
  double longitude, latitude;
  Position position = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  longitude = position.longitude;
  latitude = position.latitude;
  final Coordinates loc = new Coordinates(latitude, longitude);
  var adress = await Geocoder.local.findAddressesFromCoordinates(loc);
  var first = adress.first;
  print(position);
  print("${first.subAdminArea}");
}

class BodyWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            child: WeatherWidget(
              weather: 'sunny',
              size: Size.infinite,
              sunConfig: SunConfig(),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black),
                alignment: Alignment.center,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: null,
                  child: Text(
                    'UPDATE',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
