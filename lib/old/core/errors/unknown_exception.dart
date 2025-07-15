import 'package:weather_forecast_app/old/core/errors/base_exception.dart';
import 'package:weather_forecast_app/old/core/errors/error_message.dart';

class UnknownException extends BaseException {
  const UnknownException() : super(message: ErrorMessage.generic);
}
