import 'package:flutter/material.dart';
import 'package:weather_widget/WeatherWidget.dart';

class LightRainWid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WeatherWidget(
      size: Size.infinite,
      weather: 'Light Rainy',
      rainConfig: RainConfig(rainNum: 20),
    );
  }
}
