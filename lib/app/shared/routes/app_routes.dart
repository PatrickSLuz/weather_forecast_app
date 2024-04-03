import 'package:flutter/cupertino.dart';
import 'package:weather_forecast_app/app/ui/search/search_module.dart';
import 'package:weather_forecast_app/app/ui/unknown/unknown_page.dart';
import 'package:weather_forecast_app/app/ui/weather/weather_module.dart';

class AppRoutes {
  AppRoutes._();

  static const weatherPage = '/weather';
  static const searchPage = '/search';

  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case weatherPage:
        return CupertinoPageRoute(builder: (_) => const WeatherModule());
      case searchPage:
        return CupertinoPageRoute(builder: (_) => const SearchModule());
      default:
        return CupertinoPageRoute(builder: (_) => const UnknownPage());
    }
  }
}
