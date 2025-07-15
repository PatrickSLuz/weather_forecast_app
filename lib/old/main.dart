import 'package:flutter/material.dart';
import 'package:weather_forecast_app/old/app/app_widget.dart';
import 'package:weather_forecast_app/old/app/shared/env/environment.dart';
import 'package:weather_forecast_app/old/setup.dart';

void main() async {
  await setup(EnvFlavorEnum.prod);
  runApp(const AppWidget());
}
