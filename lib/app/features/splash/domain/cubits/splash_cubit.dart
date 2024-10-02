import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:weather_forecast_app/core/enuns/geolocation_permission_type_enum.dart';
import 'package:weather_forecast_app/core/errors/unknown_exception.dart';
import 'package:weather_forecast_app/core/geolocation/i_geolocation.dart';
import 'package:weather_forecast_app/core/states/base_state.dart';

part '../states/splash_state.dart';

class SplashCubit extends Cubit<BaseState> {
  final IGeolocation geolocation;

  SplashCubit(this.geolocation) : super(InitialState());

  Future<void> getLocation() async {
    try {
      emit(LoadingState());
      final isServiceEnabled = await geolocation.isLocationServiceEnabled;

      if (!isServiceEnabled) {
        return emit(LocationServiceDisbaledState());
      }

      GeolocationPermissionTypeEnum permission;
      permission = await geolocation.checkPermission();

      if (permission.isDenied) {
        permission = await geolocation.requestPermission();

        if (permission.isDenied) {
          return emit(ErrorState(const UnknownException()));
        }
      }

      if (permission.isDeniedForever) {
        return emit(ErrorState(const UnknownException()));
      }

      final geolocationModel = await geolocation.getGeolocation();

      if (geolocationModel == null) {
        return emit(ErrorState(const UnknownException()));
      }

      return emit(SuccessState(geolocationModel));
    } catch (e) {
      log('SplashPage - getLocation() - Error: ${e.toString()}');
      emit(ErrorState(const UnknownException()));
    }
  }
}
