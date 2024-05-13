import 'dart:developer';

import 'package:flutter_svg/flutter_svg.dart';

Future<void> preloadSVGs(List<String> assetPaths) async {
  log('Preloading SVGs');
  for (final path in assetPaths) {
    final loader = SvgAssetLoader(path);
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
      () => loader.loadBytes(null),
    );
  }
}
