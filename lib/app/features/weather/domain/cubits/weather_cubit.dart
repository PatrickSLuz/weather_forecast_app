import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:weather_forecast_app/app/features/weather/domain/repositories/i_weather_repository.dart';
import 'package:weather_forecast_app/core/errors/base_exception.dart';
import 'package:weather_forecast_app/core/errors/default_exception.dart';
import 'package:weather_forecast_app/core/errors/unknown_exception.dart';
import 'package:weather_forecast_app/core/states/base_state.dart';

class WeatherCubit extends Cubit<BaseState> {
  final IWeatherRepository repository;
  final num? lat;
  final num? lng;

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
      final weather = await repository.getWeather(lat, lng);

      if (weather != null) {
        return emit(SuccessState(weather));
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
