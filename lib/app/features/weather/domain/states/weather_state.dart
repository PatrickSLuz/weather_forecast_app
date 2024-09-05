import 'package:weather_forecast_app/app/features/weather/domain/models/weather_model.dart';
import 'package:weather_forecast_app/core/models/address_model.dart';
import 'package:weather_forecast_app/core/states/base_state.dart';

class WeatherSuccessState extends BaseState {
  final WeatherModel weather;
  final AddressModel address;

  WeatherSuccessState({
    required this.weather,
    required this.address,
  });
}
