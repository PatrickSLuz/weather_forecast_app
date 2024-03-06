import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentService {
  EnvironmentService._();
  static final String apiUrl = dotenv.get('API_URL');
  static final String apiAppId = dotenv.get('API_APP_ID');
}
