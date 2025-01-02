import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/features/about/ui/about_page.dart';

class AboutModule extends StatelessWidget {
  const AboutModule({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics.instance.logScreenView(screenName: 'AboutPage');
    return const AboutPage();
  }
}
