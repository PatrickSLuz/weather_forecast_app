import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:weather_forecast_app/app/shared/env/environment.dart';
import 'package:weather_forecast_app/design_system/assets/preload_svg.dart';
import 'package:weather_forecast_app/firebase_options.dart';
import 'package:weather_forecast_app/injector.dart';

Future<void> setup(EnvFlavorEnum flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  SemanticsBinding.instance.ensureSemantics();

  unawaited(MobileAds.instance.initialize());

  Environment.setFlavor(flavor);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  injector();

  await preloadSVGs();
}
