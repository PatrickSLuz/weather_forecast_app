import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:weather_forecast_app/config/assets/preload_svg.dart';
import 'package:weather_forecast_app/config/env/env.dart';
import 'package:weather_forecast_app/config/firebase_options.dart';
import 'package:weather_forecast_app/config/l10n/internationalization.dart';

Future<void> setup(EnvFlavor flavor) async {
  Env.setFlavor(flavor);

  WidgetsFlutterBinding.ensureInitialized();
  SemanticsBinding.instance.ensureSemantics();

  unawaited(MobileAds.instance.initialize());

  await firebaseSetup();

  await AppI10n.setup();

  await preloadSVGs();
}

Future<void> firebaseSetup() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (Env.isProd && !kDebugMode) {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}
