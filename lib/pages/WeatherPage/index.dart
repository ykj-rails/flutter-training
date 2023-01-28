import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumemi_weather/yumemi_weather.dart';
import 'package:flutter_training/pages/SplashPage/index.dart';

// WeatherPageのState
class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _weatherCondition = '';

  String _getWeatherCondition() {
    final yumemiWeather = YumemiWeather();
    final weatherCondition = yumemiWeather.fetchSimpleWeather();
    return weatherCondition;
  }

  void _setWeatherCondition() {
    setState(() {
      _weatherCondition = _getWeatherCondition();
    });
  }

  String _getWeatherPath() {
    switch (_weatherCondition) {
      case 'sunny':
        return 'assets/sunny.svg';
      case 'cloudy':
        return 'assets/cloudy.svg';
      case 'rainy':
        return 'assets/rainy.svg';
      default:
        return '';
    }
  }

  void handleSplashPage() {
    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const SplashPage(),
      ),
      ModalRoute.withName('/'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1,
                      child: _weatherCondition == ''
                          ? const Placeholder()
                          : SvgPicture.asset(
                              _getWeatherPath(),
                              semanticsLabel: _weatherCondition,
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Text(
                            '** ℃',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.blue),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Text(
                            '** ℃',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 80),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        TextButton(
                          onPressed: handleSplashPage,
                          child: const Text(
                            'Close',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        TextButton(
                          onPressed: _setWeatherCondition,
                          child: const Text(
                            'Reload',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
