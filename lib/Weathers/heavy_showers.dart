import 'package:flutter/material.dart';
import 'package:weather_widget/WeatherWidget.dart';

class HeavyRainWid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WeatherWidget(
      size: Size.infinite,
      weather: 'Heavy Rainy',
      rainConfig: RainConfig(rainNum: 100),
    );
  }
}
