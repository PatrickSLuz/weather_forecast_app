// ignore_for_file: do_not_use_environment

enum EnvFlavor {
  prod,
  dev;
}

sealed class Env {
  Env._();

  static late EnvFlavor _flavor;
  static void setFlavor(EnvFlavor flavor) {
    _flavor = flavor;
  }

  static bool get isProd => _flavor == EnvFlavor.prod;
  static bool get isDev => _flavor == EnvFlavor.dev;

  static const weatherApiUrl = String.fromEnvironment('OPEN_WEATHER_API_URL');
  static const weatherApiAppId =
      String.fromEnvironment('OPEN_WEATHER_API_APP_ID');

  static const geoApiUrl = String.fromEnvironment('GEO_API_URL');
  static const geoApiKey = String.fromEnvironment('GEO_API_KEY');
}
