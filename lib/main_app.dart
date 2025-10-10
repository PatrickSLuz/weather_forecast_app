import 'package:flutter/material.dart';
import 'package:weather_forecast_app/config/assets/precache_image.dart';
import 'package:weather_forecast_app/config/l10n/internationalization.dart';
import 'package:weather_forecast_app/config/routes/router.dart';
import 'package:weather_forecast_app/main_viewmodel.dart';
import 'package:weather_forecast_app/ui/core/theme/app_theme.dart';

class MainApp extends StatefulWidget {
  final MainViewmodel viewmodel;

  const MainApp({
    super.key,
    required this.viewmodel,
  });

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void dispose() {
    widget.viewmodel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    precacheImages(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppI10n.localizationsDelegates,
      supportedLocales: AppI10n.supportedLocales,
      routerConfig: AppRouter.config,
      title: 'Clima Atual',
      theme: AppTheme.data,
    );
  }
}
