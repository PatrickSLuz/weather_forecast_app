import 'package:flutter/cupertino.dart';
import 'package:weather_forecast_app/app/features/about/ui/about_module.dart';
import 'package:weather_forecast_app/app/features/search/ui/search_module.dart';
import 'package:weather_forecast_app/app/features/splash/ui/splash_module.dart';
import 'package:weather_forecast_app/design_system/pages/unknown_page.dart';
import 'package:weather_forecast_app/app/features/weather/ui/weather_module.dart';

class AppRoutes {
  AppRoutes._();

  static const splashPage = '/splash';
  static const weatherPage = '/weather';
  static const searchPage = '/search';
  static const aboutPage = '/about';

  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case splashPage:
        return CupertinoPageRoute(builder: (_) => const SplashModule());
      case weatherPage:
        return CupertinoPageRoute(
          builder: (_) => const WeatherModule(),
          settings: settings,
        );
      case searchPage:
        return CupertinoPageRoute(builder: (_) => const SearchModule());
      case aboutPage:
        return CupertinoPageRoute(builder: (_) => const AboutModule());
      default:
        return CupertinoPageRoute(builder: (_) => const UnknownPage());
    }
  }
}
