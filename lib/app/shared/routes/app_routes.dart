import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/ui/search/search_page.dart';
import 'package:weather_forecast_app/app/ui/unknown/unknown_page.dart';
import 'package:weather_forecast_app/app/ui/weather/weather_page.dart';

class AppRoutes {
  AppRoutes._();

  static const weatherPage = '/weather';
  static const searchPage = '/search';

  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case weatherPage:
        return MaterialPageRoute(builder: (_) => const WeatherPage());
      case searchPage:
        return MaterialPageRoute(builder: (_) => const SearchPage());
      default:
        return MaterialPageRoute(builder: (_) => const UnknownPage());
    }
  }
}
