import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/app_widget.dart';
import 'package:weather_forecast_app/app/shared/env/environment.dart';
import 'package:weather_forecast_app/setup.dart';

void main() async {
  await setup(EnvFlavorEnum.dev);
  runApp(const AppWidget());
}
