import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_forecast_app/core/enuns/geolocation_permission_type_enum.dart';
import 'package:weather_forecast_app/core/geolocation/i_geolocation.dart';
import 'package:weather_forecast_app/core/models/geolocation_model.dart';

part '../states/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final IGeolocation geolocation;

  SplashCubit(this.geolocation) : super(InitialState());

  Future<void> getLocation() async {
    final isServiceEnabled = await geolocation.isLocationServiceEnabled;

    if (!isServiceEnabled) {
      return emit(LocationServiceDisbaledState());
    }

    GeolocationPermissionTypeEnum permission;
    permission = await geolocation.checkPermission();

    if (permission.isDenied) {
      permission = await geolocation.requestPermission();

      if (permission.isDenied) {
        return emit(ErrorState());
      }
    }

    if (permission.isDeniedForever) {
      return emit(ErrorState());
    }

    final geolocationModel = await geolocation.getGeolocation();

    if (geolocationModel == null) {
      return emit(ErrorState());
    }

    return emit(SuccessState(geolocationModel));
  }
}
