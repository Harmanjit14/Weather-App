import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_widget/WeatherWidget.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  var conditions;
  var city;
  var stateW;
  var temp;
  var weatherType;
  var humidity, uvIndex, visibility, pressure, windSpeed, cloudCover;
  SunnyWid(var city, var stateW, var temp, var type) {
    this.city = city;
    this.stateW = stateW;
    this.temp = temp;
    weatherType = type;
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
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 15, 0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      '$temp°c',
                      style: TextStyle(
                          fontSize: 80,
                          color: Colors.amber[800],
                          fontWeight: FontWeight.w900),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0x30FFFFFF)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '$city',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange[800]),
                          ),
                          Text(
                            '$stateW',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.orange[800],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: ListView(
                  padding: EdgeInsets.all(15),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(0),
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0x40000000),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            '$weatherType',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0x40000000),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  FontAwesomeIcons.water,
                                  size: 50,
                                ),
                              ),
                              Text('  HUMIDITY')
                            ],
                          ),
                          Text(
                            '$humidity',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0x40000000),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.sun,
                                size: 50,
                              ),
                              Text('UV INDEX')
                            ],
                          ),
                          Text(
                            '$uvIndex',
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0x40000000),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.eye,
                                size: 50,
                              ),
                              Text('  VISIBILITY')
                            ],
                          ),
                          Text(
                            '$uvIndex',
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0x40000000),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  FontAwesomeIcons.wind,
                                  size: 50,
                                ),
                              ),
                              Text('  WIND SPEED')
                            ],
                          ),
                          Text(
                            '$windSpeed',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0x40000000),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  FontAwesomeIcons.thermometer,
                                  size: 50,
                                ),
                              ),
                              Text(' PRESSURE')
                            ],
                          ),
                          Text(
                            '$pressure',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0x40000000),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  FontAwesomeIcons.cloud,
                                  size: 50,
                                ),
                              ),
                              Text('CLOUD COVER')
                            ],
                          ),
                          Text(
                            '$cloudCover',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  color: Color(0x30FFFFFF),
                ),
                height: 580,
                width: double.infinity,
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 120,
                  child: RoundedLoadingButton(
                    color: Colors.black,
                    child: Text(
                      'UPDATE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    controller: _btnController,
                    onPressed: () {
                      _doSomething();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
