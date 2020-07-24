import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';

class WeatherData {
  double longitude, latitude;
  var conditions;
  var city;
  var state;
  int id;
  String data;
  double temp, minTemp, maxTemp, feelTemp;
  String weatherType, weatherDescription;

  WeatherData();

  double getTemp() {
    return temp;
  }

  String getCity() {
    return city;
  }

  String getState() {
    return state;
  }

  Future<void> getCoordinates() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    longitude = position.longitude;
    latitude = position.latitude;
    await getLocation(longitude, latitude);
  }

  Future<void> getLocation(double longitude, double latitude) async {
    final Coordinates loc = new Coordinates(latitude, longitude);
    var adress = await Geocoder.local.findAddressesFromCoordinates(loc);
    var first = adress.first;
    city = first.subAdminArea;
    state = first.adminArea;
    getWeather();
  }

  Future<void> getWeather() async {
    Response response = await get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=439d4b804bc8187953eb36d2a8c26a02');
    if (response.statusCode == 200) {
      data = response.body;
      temp = jsonDecode(data)['main']['temp'];
      id = jsonDecode(data)['weather'][0]['id'];
      printData();
    }
  }

  void printData() {
    print(city);
    print(state);
    print(temp);
    print(id);
  }
}
