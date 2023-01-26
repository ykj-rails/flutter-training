import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_training/pages/SplashPage/index.dart';
import 'package:flutter_training/pages/WeatherPage/index.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      routes: <String, WidgetBuilder>{
        '/weather': (context) => const WeatherPage()
      },
    ),
  );
}
