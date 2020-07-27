import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_widget/WeatherWidget.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

/*class SunnyWid extends StatefulWidget {
  

  @override
  _SunnyWidState createState() => _SunnyWidState();
}

class _SunnyWidState extends State<SunnyWid> {
  _SunnyWidState();

  @override
  void initState() {
    print(widget.city);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/

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
  double temp, minTemp, maxTemp, feelTemp;
  var weatherType, weatherDescription;
  SunnyWid(
      var city, var stateW, var temp, var minT, var maxT, var type, var descp) {
    this.city = city;
    this.stateW = stateW;
    this.temp = temp;
    minTemp = minT;
    maxTemp = maxT;
    weatherType = type;
    weatherDescription = descp;
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
                    },
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            '${temp.toInt()}',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'MIN',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: Text(
                                '${minTemp.toInt()}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: Text(
                                'MAX',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: Text(
                                '${maxTemp.toInt()}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerRight,
                          child: Expanded(
                            child: Text(
                              '$city',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Expanded(
                            child: Text(
                              '$stateW',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
