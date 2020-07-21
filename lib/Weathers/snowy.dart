import 'package:flutter/material.dart';
import 'package:weather_widget/WeatherWidget.dart';

class SnowyWid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WeatherWidget(
      size: Size.infinite,
      weather: 'Snowy',
      snowConfig: SnowConfig(
        snowNum: 30,
      ),
    );
  }
}
