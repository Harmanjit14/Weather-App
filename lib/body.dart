import 'dart:async';
import 'package:Weather_App/database.dart';
import 'package:flutter/material.dart';
import 'package:weather_widget/WeatherWidget.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class BodyWidgets extends StatefulWidget {
  @override
  _BodyWidgetsState createState() => _BodyWidgetsState();
}

class _BodyWidgetsState extends State<BodyWidgets> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      //Navigator.pushNamed(context, '/$x');
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
              weather: 'Sunny',
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
                  child: Text('LOCATE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  controller: _btnController,
                  onPressed: () {
                    WeatherData obj = WeatherData();
                    obj.getCoordinates(context);
                    _doSomething();

                    //print(x);
                    //Navigator.pushNamed(context, '/$x');
                  },
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Text(
                  'WEATHER APP',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Press Locate to Start',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(8),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Made with ❤',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
