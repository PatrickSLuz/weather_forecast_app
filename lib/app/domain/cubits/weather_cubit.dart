import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_forecast_app/app/domain/errors/errors.dart';
import 'package:weather_forecast_app/app/domain/models/city_model.dart';
import 'package:weather_forecast_app/app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/app/domain/repositories/weather_repository.dart';

part '../states/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  final CityModel? city;

  WeatherCubit(
    this.weatherRepository,
    this.city,
  ) : super(WeatherInitial()) {
    if (city != null) {
      getWeather(city!.lat, city!.lng);
    } else {
      emit(ErrorState(Failure()));
    }
  }

  Future<void> getWeather(num lat, num lng) async {
    emit(const LoadingState());
    final newState = await weatherRepository.getWeather(lat, lng);
    emit(newState);
  }
}
