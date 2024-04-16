import 'package:flutter/cupertino.dart';
import 'package:weather_forecast_app/app/ui/search/search_module.dart';
import 'package:weather_forecast_app/app/ui/splash/splash_page.dart';
import 'package:weather_forecast_app/app/ui/unknown/unknown_page.dart';
import 'package:weather_forecast_app/app/ui/weather/weather_module.dart';

class AppRoutes {
  AppRoutes._();

  static const splashPage = '/splash';
  static const weatherPage = '/weather';
  static const searchPage = '/search';

  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case splashPage:
        return CupertinoPageRoute(builder: (_) => const SplashPage());
      case weatherPage:
        return CupertinoPageRoute(
          builder: (_) => const WeatherModule(),
          settings: settings,
        );
      case searchPage:
        return CupertinoPageRoute(builder: (_) => const SearchModule());
      default:
        return CupertinoPageRoute(builder: (_) => const UnknownPage());
    }
  }
}
