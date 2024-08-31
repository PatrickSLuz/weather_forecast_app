import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app_routes.dart';
import 'package:weather_forecast_app/design_system/theme/app_theme.dart';
import 'package:weather_forecast_app/app/features/splash/ui/splash_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clima Atual',
      theme: AppTheme.data,
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generate,
      home: const SplashModule(),
    );
  }
}
