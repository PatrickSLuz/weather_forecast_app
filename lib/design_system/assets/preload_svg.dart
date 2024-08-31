import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_forecast_app/design_system/assets/app_assets.dart';

Future<void> preloadSVGs() async {
  const assetPaths = [
    AppAssets.cloud,
    AppAssets.cloudDay,
    AppAssets.cloudNight,
    AppAssets.cloudRainDay,
    AppAssets.cloudRainNight,
    AppAssets.clouds,
    AppAssets.cloudsDay,
    AppAssets.cloudsNight,
    AppAssets.mistDay,
    AppAssets.mistNight,
    AppAssets.moon,
    AppAssets.rain,
    AppAssets.snow,
    AppAssets.snowDay,
    AppAssets.snowNight,
    AppAssets.storm,
    AppAssets.stormNight,
    AppAssets.sun,
  ];
  for (final path in assetPaths) {
    final loader = SvgAssetLoader(path);
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
      () => loader.loadBytes(null),
    );
  }
}
