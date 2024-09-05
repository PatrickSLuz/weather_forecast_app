import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:weather_forecast_app/app/features/weather/domain/repositories/i_weather_repository.dart';
import 'package:weather_forecast_app/app/features/weather/domain/states/weather_state.dart';
import 'package:weather_forecast_app/core/errors/base_exception.dart';
import 'package:weather_forecast_app/core/errors/default_exception.dart';
import 'package:weather_forecast_app/core/errors/unknown_exception.dart';
import 'package:weather_forecast_app/core/functions/coordinates_to_address_function.dart';
import 'package:weather_forecast_app/core/states/base_state.dart';

class WeatherCubit extends Cubit<BaseState> {
  final IWeatherRepository repository;

  num? lat;
  num? lng;

  WeatherCubit(
    this.repository,
    this.lat,
    this.lng,
  ) : super(InitialState()) {
    if (lat != null && lng != null) {
      getWeather(lat!, lng!);
    } else {
      emit(ErrorState(const DefaultException(
        message:
            'Não foi possível buscar os dados de clima, pois os dados de localizaçao estão inválidos. Por favor, tente novamente.',
      )));
    }
  }

  Future<void> getWeather([num? lat, num? lng]) async {
    try {
      emit(LoadingState());

      if (lat != null && lat != 0) this.lat = lat;
      if (lng != null && lng != 0) this.lng = lng;

      final weather = await repository.getWeather(this.lat, this.lng);
      final address = await coordinatesToAddress(this.lat, this.lng);

      if (weather != null && address != null) {
        return emit(WeatherSuccessState(
          weather: weather,
          address: address,
        ));
      }

      emit(ErrorState(const DefaultException(
        message:
            'Não foi possível buscar os dados de clima. Por favor, tente novamente.',
      )));
    } on BaseException catch (baseException) {
      log(baseException.message);
      emit(ErrorState(baseException));
    } catch (e) {
      log(e.toString());
      emit(ErrorState(const UnknownException()));
    }
  }
}
