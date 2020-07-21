import 'dart:async';
import 'package:Weather_App/database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:weather_widget/WeatherWidget.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

void getLocation() async {
  WeatherData obj;
  double longitude, latitude;
  Position position = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  longitude = position.longitude;
  latitude = position.latitude;
  final Coordinates loc = new Coordinates(latitude, longitude);
  var adress = await Geocoder.local.findAddressesFromCoordinates(loc);
  var first = adress.first;

  obj.setCoordinates(longitude, latitude);
  obj.setLocation(first.subAdminArea);
}

class CloudyWid extends StatelessWidget {
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
                weather: 'Cloudy',
                cloudConfig: CloudConfig(),
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
                      getLocation();
                      Navigator.pushNamed(context, '/cloudy');
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
