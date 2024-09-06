import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:weather_forecast_app/environment.dart';

const adUnitId = 'ca-app-pub-5906691229604512/9346174530';
const adUnitIdTestAndroid = 'ca-app-pub-3940256099942544/6300978111';
const adUnitIdTestIos = 'ca-app-pub-3940256099942544/2934735716';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_bannerAd == null || !_isLoaded) {
      return const SizedBox.shrink();
    }

    return SafeArea(
      child: Container(
        color: Colors.white,
        alignment: Alignment.bottomCenter,
        width: _bannerAd!.size.width.toDouble(),
        height: _bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      ),
    );
  }

  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: getAdUnitId(),
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() => _isLoaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    )..load();
  }

  String getAdUnitId() {
    if (Environment.isDev) {
      if (Platform.isIOS) return adUnitIdTestIos;
      return adUnitIdTestAndroid;
    }
    return adUnitId;
  }
}
