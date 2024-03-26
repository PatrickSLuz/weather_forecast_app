import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_forecast_app/app/domain/errors/errors.dart';
import 'package:weather_forecast_app/app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/app/domain/repositories/weather_forecast_repository.dart';

part '../states/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherForecastRepository weatherRepository;
  WeatherCubit(this.weatherRepository) : super(WeatherInitial()) {
    getForecast(-25.43648, -49.26792);
  }

  Future<void> getForecast(num lat, num lng) async {
    emit(const LoadingState());
    final newState = await weatherRepository.getWeatherForecast(lat, lng);
    emit(newState);
  }
}
