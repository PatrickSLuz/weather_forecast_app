import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:weather_forecast_app/app/app_widget.dart';
import 'package:weather_forecast_app/environment.dart';
import 'package:weather_forecast_app/injector.dart';
import 'package:weather_forecast_app/design_system/assets/preload_svg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SemanticsBinding.instance.ensureSemantics();

  unawaited(MobileAds.instance.initialize());

  await dotenv.load(fileName: 'environment/dev.env');
  Environment.flavor = EnvFlavorEnum.dev;
  injector();
  await preloadSVGs();

  runApp(const AppWidget());
}
