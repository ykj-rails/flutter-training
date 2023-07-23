import 'dart:collection';

mixin EndOfFrame {
  Future<void> handleWeatherPage() async {
    await WidgetsBinding.instance.endOfFrame;
    await Future<void>.delayed(const Duration(milliseconds: 500));
    pushWeatherPage();
  }
}
