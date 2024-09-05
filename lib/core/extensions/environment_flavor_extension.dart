import 'package:weather_forecast_app/environment.dart';

extension EnvFlavorEnumExtension on EnvFlavorEnum {
  bool get isProd => this == EnvFlavorEnum.prod;
  bool get isDev => this == EnvFlavorEnum.dev;
}
