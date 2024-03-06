import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_forecast_app/app/core/services/dependency_injection_service.dart';
import 'package:weather_forecast_app/app/domain/repositories/weather_forecast_repository.dart';

void main() async {
  await dotenv.load(fileName: '.env');
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
              getIt<WeatherForecastRepository>().getWeatherForecast(-25, -49);
            },
          ),
        ),
      ),
    );
  }
}
