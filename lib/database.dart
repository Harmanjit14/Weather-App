import 'package:Weather_App/Weathers/cloudy.dart';
import 'package:Weather_App/Weathers/heavy_showers.dart';
import 'package:Weather_App/Weathers/ligh_showers.dart';
import 'package:Weather_App/Weathers/snowy.dart';
import 'package:Weather_App/Weathers/sunny.dart';
import 'package:Weather_App/Weathers/thunder.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class WeatherData {
  double longitude, latitude;
  var conditions;
  var city;
  var state;
  var id, pane;
  var data;
  var temp;
  var weatherType;
  WeatherData obj;

  WeatherData();

  void setObject(WeatherData x) {
    obj = x;
  }

  double getTemp() {
    return temp;
  }

  String getCity() {
    return city;
  }

  String getState() {
    return state;
  }

  Future<void> getCoordinates(BuildContext context) async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    longitude = position.longitude;
    latitude = position.latitude;
    getLocation(longitude, latitude, context);
  }

  void getLocation(
      double longitude, double latitude, BuildContext context) async {
    final Coordinates loc = new Coordinates(latitude, longitude);
    var adress = await Geocoder.local.findAddressesFromCoordinates(loc);
    var first = adress.first;
    city = first.subAdminArea;
    state = first.adminArea;
    getWeather(context);
  }

  void getWeather(BuildContext context) async {
    Response response = await get(
        'http://api.weatherstack.com/current?access_key=ccabaee17421932979d25564ff21f943&query=$city');

    data = response.body;
    temp = jsonDecode(data)['current']['temperature'];
    id = jsonDecode(data)['current']['weather_code'];
    weatherType = jsonDecode(data)['weather_descriptions'];

    weatherScreen(context);
  }

  Future<void> weatherScreen(BuildContext context) async {
    {
      if ((id >= 200 && id <= 232) || id == 781) {
        pane = 5;
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => ThunderWid()),
        );
      } else if (id >= 300 && id <= 500) {
        pane = 2;

        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => LightRainWid()),
        );
      } else if (id >= 501 && id <= 531) {
        pane = 3;

        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => HeavyRainWid()),
        );
      } else if (id >= 600 && id <= 622) {
        pane = 4;

        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => SnowyWid()),
        );
      } else if (id == 701 || id == 741) {
        pane = 4;

        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => SnowyWid()),
        );
      } else if ((id >= 711 && id <= 731) ||
          (id >= 751 && id <= 771) ||
          id == 143) {
        pane = 0;

        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => SunnyWid(city, state, temp, weatherType),
          ),
        );
      } else if (id == 800) {
        pane = 0;
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => SunnyWid(
              city,
              state,
              temp,
              weatherType,
            ),
          ),
        );
      } else if (id >= 801 && id <= 804) {
        pane = 1;
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => CloudyWid()),
        );
      } else {
        pane = 0;
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => SunnyWid(city, state, temp, weatherType),
          ),
        );
      }
    }
  }

  void printData() {
    print(latitude);
    print(longitude);
    print(city);
    print(state);
    print(temp);
    print(id);
    print(weatherType);
  }
}
