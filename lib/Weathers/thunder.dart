import 'package:flutter/material.dart';
import 'package:weather_widget/WeatherWidget.dart';

class ThunderWid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WeatherWidget(
      size: Size.infinite,
      weather: 'Thunder',
      thunderConfig: ThunderConfig(),
    );
  }
}
