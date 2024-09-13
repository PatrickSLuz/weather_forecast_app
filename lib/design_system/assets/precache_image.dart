import 'package:flutter/material.dart';
import 'package:weather_forecast_app/design_system/assets/app_assets.dart';

Future<void> precacheImages(BuildContext context) async {
  const assetPaths = [
    AppAssets.appLogo,
  ];

  for (final path in assetPaths) {
    precacheImage(AssetImage(path), context);
  }
}
