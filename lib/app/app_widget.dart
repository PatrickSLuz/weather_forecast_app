import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/shared/routes/app_routes.dart';
import 'package:weather_forecast_app/app/shared/theme/app_theme.dart';
import 'package:weather_forecast_app/app/ui/splash/splash_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Previsão do Tempo',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generate,
      home: const SplashModule(),
    );
  }
}
