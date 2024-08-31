import 'package:weather_forecast_app/core/enuns/geolocation_permission_type_enum.dart';
import 'package:weather_forecast_app/core/models/geolocation_model.dart';

abstract interface class IGeolocation {
  Future<bool> get isLocationServiceEnabled;

  Future<GeolocationPermissionTypeEnum> checkPermission();
  Future<GeolocationPermissionTypeEnum> requestPermission();

  Future<GeolocationModel?> getGeolocation();

  Future<bool> openAppSettings();
  Future<bool> openLocationSettings();
}
