import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_forecast_app/app/data/services/app_geolocation_service.dart';
import 'package:weather_forecast_app/app/domain/errors/errors.dart';
import 'package:weather_forecast_app/app/domain/models/enuns/geolocation_permission_type_enum.dart';
import 'package:weather_forecast_app/app/domain/models/geolocation_model.dart';

part '../states/geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  final AppGeolocationService geolocationService;

  GeolocationCubit(this.geolocationService) : super(InitialState());

  Future<void> getLocation() async {
    final isServiceEnabled = await geolocationService.isLocationServiceEnabled;

    if (!isServiceEnabled) {
      return emit(LocationServiceDisbaledState());
    }

    GeolocationPermissionTypeEnum permission;
    permission = await geolocationService.checkPermission();

    if (permission.isDenied) {
      permission = await geolocationService.requestPermission();

      if (permission.isDenied) {
        return emit(GeolocationErrorState(Failure()));
      }
    }

    if (permission.isDeniedForever) {
      return emit(GeolocationErrorState(Failure()));
    }

    final geolocation = await geolocationService.getGeolocation();

    if (geolocation == null) {
      return emit(GeolocationErrorState(Failure()));
    }

    return emit(GeolocationSuccessState(geolocation));
  }
}
