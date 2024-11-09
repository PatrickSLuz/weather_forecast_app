import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:weather_forecast_app/app/shared/env/environment.dart';
import 'package:weather_forecast_app/core/client/geo/geo_client_interceptor_impl.dart';
import 'package:weather_forecast_app/core/client/geo/i_geo_rest_client.dart';
import 'package:weather_forecast_app/core/client/weather/i_weather_rest_client.dart';
import 'package:weather_forecast_app/core/client/weather/weather_client_interceptor_impl.dart';
import 'package:weather_forecast_app/design_system/assets/preload_svg.dart';
import 'package:weather_forecast_app/injector.dart';

addInterceptors() {
  final weatherRestClient = getIt<IWeatherRestClient>();
  final geoRestClient = getIt<IGeoRestClient>();

  weatherRestClient.addInterceptors(WeatherClientInterceptorImpl());
  geoRestClient.addInterceptors(GeoClientInterceptorImpl());
}

Future<void> setup(EnvFlavorEnum flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  SemanticsBinding.instance.ensureSemantics();

  unawaited(MobileAds.instance.initialize());

  Environment.setFlavor(flavor);

  await dotenv.load(
    fileName: switch (flavor) {
      EnvFlavorEnum.prod => 'environment/prod.env',
      EnvFlavorEnum.dev => 'environment/dev.env',
    },
  );

  await Firebase.initializeApp(options: FirebaseEnv.options);
  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

  injector();

  await preloadSVGs();
}
