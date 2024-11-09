import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvFlavorEnum {
  prod,
  dev;
}

class Environment {
  Environment._();

  static late EnvFlavorEnum _flavor;
  static void setFlavor(EnvFlavorEnum flavor) {
    _flavor = flavor;
  }

  static bool get isProd => _flavor == EnvFlavorEnum.prod;
  static bool get isDev => _flavor == EnvFlavorEnum.dev;

  static final weatherApiUrl = dotenv.get('OPEN_WEATHER_API_URL');
  static final weatherApiAppId = dotenv.get('OPEN_WEATHER_API_APP_ID');

  static final geoApiUrl = dotenv.get('GEO_API_URL');
  static final geoApiKey = dotenv.get('GEO_API_KEY');
}

class FirebaseEnv {
  FirebaseEnv._();

  static final options = FirebaseOptions(
    apiKey: apiKey,
    appId: appId,
    projectId: projectId,
    messagingSenderId: messagingSenderId,
  );

  static final apiKey = dotenv.get('FIREBASE_API_KEY');
  static final appId = dotenv.get('FIREBASE_APP_ID');
  static final projectId = dotenv.get('FIREBASE_PROJECT_ID');
  static final messagingSenderId = dotenv.get('FIREBASE_MESSAGING_SENDER_ID');
}
