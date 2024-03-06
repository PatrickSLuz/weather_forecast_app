import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/core/services/dependency_injection_service.dart';
import 'package:weather_forecast_app/app/data/repositories/open_weather_map_repository.dart';

void main() {
  DependencyInjectionService.register();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            child: const Text('Call API'),
            onPressed: () {
              getIt<OpenWeatherMapRepository>().getForecast(-25, -49);
            },
          ),
        ),
      ),
    );
  }
}
