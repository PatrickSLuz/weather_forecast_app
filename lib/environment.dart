import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvFlavorEnum {
  prod,
  dev;
}

class Environment {
  Environment._();

  static late EnvFlavorEnum _flavor;
  static setFlavor(EnvFlavorEnum flavor) {
    _flavor = flavor;
  }

  static bool get isProd => _flavor == EnvFlavorEnum.prod;
  static bool get isDev => _flavor == EnvFlavorEnum.dev;

  static final weatherApiUrl = dotenv.get('OPEN_WEATHER_API_URL');
  static final weatherApiAppId = dotenv.get('OPEN_WEATHER_API_APP_ID');

  static final geoApiUrl = dotenv.get('GEO_API_URL');
  static final geoApiKey = dotenv.get('GEO_API_KEY');
}
