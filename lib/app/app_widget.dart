import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app_routes.dart';
import 'package:weather_forecast_app/core/application_info/i_application_info.dart';
import 'package:weather_forecast_app/design_system/assets/precache_image.dart';
import 'package:weather_forecast_app/design_system/theme/app_theme.dart';
import 'package:weather_forecast_app/app/features/splash/ui/splash_module.dart';
import 'package:weather_forecast_app/injector.dart';
import 'package:weather_forecast_app/l10n/internationalization.dart';

abstract class NavigatorService {
  static final key = GlobalKey<NavigatorState>();
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigatorService.key,
      localizationsDelegates: AppIntl.localizationsDelegates,
      supportedLocales: AppIntl.supportedLocales,
      title: 'Clima Atual',
      theme: AppTheme.data,
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generate,
      builder: materialAppBuilder,
      home: const SplashModule(),
    );
  }

  Widget materialAppBuilder(BuildContext context, Widget? child) {
    getIt<IApplicationInfo>().init();
    AppIntl.setupLocale(context);
    precacheImages(context);
    return child ?? const SizedBox.shrink();
  }
}
