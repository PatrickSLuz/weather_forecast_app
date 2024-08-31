import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_forecast_app/app/app_widget.dart';
import 'package:weather_forecast_app/injector.dart';
import 'package:weather_forecast_app/design_system/assets/preload_svg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SemanticsBinding.instance.ensureSemantics();

  await dotenv.load(fileName: '.env');
  injector();
  await preloadSVGs();

  runApp(const AppWidget());
}
