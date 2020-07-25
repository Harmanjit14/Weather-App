import 'package:Weather_App/Weathers/cloudy.dart';
import 'package:Weather_App/Weathers/heavy_showers.dart';
import 'package:Weather_App/Weathers/ligh_showers.dart';
import 'package:Weather_App/Weathers/snowy.dart';
import 'package:Weather_App/Weathers/thunder.dart';
import 'package:flutter/material.dart';
import 'body.dart';
import 'Weathers/sunny.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => BodyPage(),
        '/0': (context) => SunnyWid(),
        '/1': (context) => CloudyWid(),
        '/2': (context) => LightRainWid(),
        '/3': (context) => HeavyRainWid(),
        '/4': (context) => SnowyWid(),
        '/5': (context) => ThunderWid(),
      },
    );
  }
}

class BodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWidgets(),
    );
  }
}
