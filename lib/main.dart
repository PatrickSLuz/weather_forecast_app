import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_forecast_app/app/app_widget.dart';
import 'package:weather_forecast_app/app/shared/assets/assets.dart';
import 'package:weather_forecast_app/app/shared/dependency_injection/dependency_injection.dart';
import 'package:weather_forecast_app/app/shared/helpers/preload_svg.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  DependencyInjection.register();

  await preloadSVGs([
    Assets.cloud,
    Assets.cloudDay,
    Assets.cloudNight,
    Assets.cloudRainDay,
    Assets.cloudRainNight,
    Assets.clouds,
    Assets.cloudsDay,
    Assets.cloudsNight,
    Assets.mistDay,
    Assets.mistNight,
    Assets.moon,
    Assets.rain,
    Assets.snow,
    Assets.snowDay,
    Assets.snowNight,
    Assets.storm,
    Assets.stormNight,
    Assets.sun,
  ]);

  runApp(const AppWidget());
}
