import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_forecast_app/app/app_widget.dart';
import 'package:weather_forecast_app/app/shared/dependency_injection/dependency_injection.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  DependencyInjection.register();

  runApp(const AppWidget());
}
