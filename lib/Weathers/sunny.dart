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
              alignment: Alignment.center,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${temp.toInt()}°c',
                        style: TextStyle(
                            fontSize: 65,
                            color: Colors.yellow[900],
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Min ',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.yellow,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            '${minTemp.toInt()}°c',
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.yellow[900],
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Max ',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.yellow,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            '${maxTemp.toInt()}°c',
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.yellow[900],
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xffb2f2519).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                      // changes position of shadow
                    ),
                  ],
                ),
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
                    child: Text('UPDATE',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
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
