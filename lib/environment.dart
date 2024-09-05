import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  Environment._();

  static final weatherApiUrl = dotenv.get('OPEN_WEATHER_API_URL');
  static final weatherApiAppId = dotenv.get('OPEN_WEATHER_API_APP_ID');

  static final geoApiUrl = dotenv.get('GEO_API_URL');
  static final geoApiKey = dotenv.get('GEO_API_KEY');
}
