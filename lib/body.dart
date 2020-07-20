import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:weather_widget/WeatherWidget.dart';
import 'package:weather_widget/example/main.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

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

class BodyWidgets extends StatefulWidget {
  @override
  _BodyWidgetsState createState() => _BodyWidgetsState();
}

class _BodyWidgetsState extends State<BodyWidgets> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(Duration(seconds: 1), () {
      _btnController.success();
    });
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
    });
  }

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
                width: 120,
                height: 50,
                alignment: Alignment.center,
                child: RoundedLoadingButton(
                  color: Colors.black,
                  child: Text('UPDATE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  controller: _btnController,
                  onPressed: _doSomething,
                ),

                /*FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: null,
                  child: Text(
                    'UPDATE',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),*/
              ),
            ),
          ),
        ],
      ),
    );
  }
}
