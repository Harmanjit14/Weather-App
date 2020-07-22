import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:weather_widget/WeatherWidget.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

void getCoordinates() async {
  double longitude, latitude;
  Position position = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  longitude = position.longitude;
  latitude = position.latitude;
  getLocation(longitude, latitude);
}

void getLocation(double longitude, double latitude) async {
  var city;
  var state;
  final Coordinates loc = new Coordinates(latitude, longitude);
  var adress = await Geocoder.local.findAddressesFromCoordinates(loc);
  var first = adress.first;
  city = first.subAdminArea;
  state = first.adminArea;
  print(city);
  print(state);
}

class SunnyWid extends StatelessWidget {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  void _doSomething() async {
    Timer(Duration(seconds: 1), () {
      _btnController.success();
    });
    Timer(Duration(seconds: 4), () {
      _btnController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Container(
              child: WeatherWidget(
                size: Size.infinite,
                weather: 'Sunny',
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
                    onPressed: () {
                      _doSomething();
                      getCoordinates();
                      Navigator.pushNamed(context, '/thunder');
                    },
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'PRESS UPDATE',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
