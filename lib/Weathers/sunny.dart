import 'package:flutter/material.dart';
import 'package:weather_widget/WeatherWidget.dart';

class SunnyWid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WeatherWidget(
      weather: 'random',
      size: Size.infinite,
      sunConfig: SunConfig(),
      cloudConfig: CloudConfig(),
    );
  }
}
