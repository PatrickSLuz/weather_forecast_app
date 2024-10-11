import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
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

  await dotenv.load(fileName: 'environment/prod.env');
  Environment.setFlavor(EnvFlavorEnum.prod);

  await Firebase.initializeApp(options: FirebaseEnv.options);
  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

  injector();

  await preloadSVGs();

  runApp(const AppWidget());
}
