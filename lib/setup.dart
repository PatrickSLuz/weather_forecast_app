import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
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

  await firebaseSetup();

  injector();

  await preloadSVGs();
}

Future<void> firebaseSetup() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}
