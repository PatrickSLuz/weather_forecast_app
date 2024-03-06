import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/ui/weather_forecast_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Previsão do Tempo',
      initialRoute: '/',
      home: WeatherForecastModule(),
    );
  }
}
