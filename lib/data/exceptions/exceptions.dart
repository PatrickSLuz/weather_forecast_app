import 'package:weather_forecast_app/config/constants/error_messages.dart';
import 'package:weather_forecast_app/data/exceptions/app_exception.dart';

class DefaultException extends AppException {
  DefaultException(super.message);
}

class ApiException extends AppException {
  ApiException(super.message, [super.stackTrace]);
}

class UnknownException extends AppException {
  UnknownException() : super(ErrorMessage.generic);
}
