import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast_app/config/dependencies.dart';
import 'package:weather_forecast_app/config/env/env.dart';
import 'package:weather_forecast_app/config/setup.dart';
import 'package:weather_forecast_app/main_app.dart';
import 'package:weather_forecast_app/main_viewmodel.dart';

void main() async {
  await setup(EnvFlavor.prod);
  runApp(
    MultiProvider(
      providers: registerDependencies(),
      child: ListenableProvider(
        create: (ctx) => MainViewmodel(),
        builder: (context, child) {
          return MainApp(viewmodel: context.read());
        },
      ),
    ),
  );
}
