// import 'package:geocoder/geocoder.dart';
// import 'package:geolocator/geolocator.dart';
// import 'dart:async';

// class WeatherData {
//   double longitude, latitude, temperature;
//   var conditions;
//   var city;
//   var state;

//   WeatherData();

//   void setCoordinates(double long, double lat) {
//     latitude = lat;
//     longitude = long;
//   }

//   void setLocation(var c, var s) {
//     city = c;
//     state = s;
//   }

//   void setWeather(double temp, var condition) {
//     temperature = temp;
//     conditions = condition;
//   }

//   void getLocation() async {
//     final Coordinates loc = new Coordinates(latitude, longitude);
//     var adress = await Geocoder.local.findAddressesFromCoordinates(loc);
//     var first = adress.first;
//     city = first.subAdminArea;
//     state = first.adminArea;
//   }

//   void getCoordinates() async {
//     Position position = await Geolocator()
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//     longitude = position.longitude;
//     latitude = position.latitude;
//   }
// }
