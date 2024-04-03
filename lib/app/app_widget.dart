import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/shared/theme/app_theme.dart';
import 'package:weather_forecast_app/app/ui/weather/weather_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Previsão do Tempo',
      initialRoute: '/',
      theme: AppTheme.lightTheme,
      home: const WeatherModule(),
    );
  }
}
