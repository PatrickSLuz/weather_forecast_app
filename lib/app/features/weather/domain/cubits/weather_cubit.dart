import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_forecast_app/app/features/weather/domain/models/weather_model.dart';
import 'package:weather_forecast_app/app/features/weather/domain/repositories/i_weather_repository.dart';
import 'package:weather_forecast_app/core/errors/base_exception.dart';
import 'package:weather_forecast_app/core/errors/default_exception.dart';
import 'package:weather_forecast_app/core/errors/unknown_exception.dart';

part '../states/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final IWeatherRepository repository;
  final num? lat;
  final num? lng;

  WeatherCubit(
    this.repository,
    this.lat,
    this.lng,
  ) : super(WeatherInitial()) {
    if (lat != null && lng != null) {
      getWeather(lat!, lng!);
    } else {
      emit(const ErrorState(DefaultException(
        message:
            'Não foi possível buscar os dados de clima, pois os dados de localizaçao estão inválidos. Por favor, tente novamente.',
      )));
    }
  }

  Future<void> getWeather([num? lat, num? lng]) async {
    try {
      emit(const LoadingState());
      final weather = await repository.getWeather(lat, lng);

      if (weather != null) {
        return emit(SuccessState(weather));
      }

      emit(const ErrorState(DefaultException(
        message:
            'Não foi possível buscar os dados de clima. Por favor, tente novamente.',
      )));
    } on BaseException catch (baseException) {
      log(baseException.message);
      emit(ErrorState(baseException));
    } catch (e) {
      log(e.toString());
      emit(const ErrorState(UnknownException()));
    }
  }
}
