// ignore_for_file: do_not_use_environment

enum EnvFlavorEnum {
  prod,
  dev;
}

sealed class Environment {
  Environment._();

  static late EnvFlavorEnum _flavor;
  static void setFlavor(EnvFlavorEnum flavor) {
    _flavor = flavor;
  }

  static bool get isProd => _flavor == EnvFlavorEnum.prod;
  static bool get isDev => _flavor == EnvFlavorEnum.dev;

  static const weatherApiUrl = String.fromEnvironment('OPEN_WEATHER_API_URL');
  static const weatherApiAppId =
      String.fromEnvironment('OPEN_WEATHER_API_APP_ID');

  static const geoApiUrl = String.fromEnvironment('GEO_API_URL');
  static const geoApiKey = String.fromEnvironment('GEO_API_KEY');
}
