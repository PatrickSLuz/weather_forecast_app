import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  Environment._();
  static final String weatherApiUrl = dotenv.get('WEATHER_API_URL');
  static final String weatherApiAppId = dotenv.get('WEATHER_API_APP_ID');

  static final String geoApiUrl = dotenv.get('GEO_API_URL');
  static final String geoApiKey = dotenv.get('GEO_API_KEY');
}
