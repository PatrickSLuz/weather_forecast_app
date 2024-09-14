import 'package:weather_forecast_app/app/features/weather/domain/models/forecast_model.dart';
import 'package:weather_forecast_app/core/models/address_model.dart';
import 'package:weather_forecast_app/core/states/base_state.dart';

class ForecastSuccessState extends BaseState {
  final ForecastModel forecast;
  final AddressModel address;

  ForecastSuccessState({
    required this.forecast,
    required this.address,
  });
}
