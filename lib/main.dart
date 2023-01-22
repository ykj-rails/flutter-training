import 'package:flutter/material.dart';
import 'package:yumemi_weather/yumemi_weather.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:flutter_training/pages/MyHomePage/index.dart';
import 'package:flutter_training/pages/SplashPage/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}
