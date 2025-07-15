import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:weather_forecast_app/old/app/features/forecast/domain/repositories/i_forecast_repository.dart';
import 'package:weather_forecast_app/old/app/features/forecast/domain/states/forecast_state.dart';
import 'package:weather_forecast_app/old/core/errors/base_exception.dart';
import 'package:weather_forecast_app/old/core/errors/default_exception.dart';
import 'package:weather_forecast_app/old/core/errors/unknown_exception.dart';
import 'package:weather_forecast_app/old/core/functions/coordinates_to_address_function.dart';
import 'package:weather_forecast_app/old/core/geolocation/i_geolocation.dart';
import 'package:weather_forecast_app/old/core/states/base_state.dart';
import 'package:weather_forecast_app/old/core/validators/coord_validator.dart';

class ForecastCubit extends Cubit<BaseState> {
  final IForecastRepository repository;
  final IGeolocation geolocation;

  ForecastCubit(
    this.repository,
    this.geolocation,
    num? lat,
    num? lng,
  ) : super(InitialState()) {
    getForecast(lat, lng);
  }

  Future<void> getForecast([num? lat, num? lng]) async {
    try {
      emit(LoadingState());

      if (!CoordValidator.isValid(lat, lng)) {
        final location = await geolocation.getGeolocation();
        lat = location?.latitude;
        lng = location?.longitude;
      }

      if (!CoordValidator.isValid(lat, lng)) {
        return emit(ErrorState(const DefaultException(
          message:
              'Não foi possível buscar os dados de clima, pois os dados de localizaçao estão inválidos. Por favor, tente novamente.',
        )));
      }

      final forecast = await repository.getForecast(lat, lng);
      final address = await coordinatesToAddress(lat, lng);

      if (forecast != null && address != null) {
        return emit(ForecastSuccessState(
          forecast: forecast,
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
