import 'package:weather_forecast_app/app/features/search/domain/models/enuns/geolocation_permission_type_enum.dart';
import 'package:weather_forecast_app/app/features/search/domain/models/geolocation_model.dart';

abstract class AppGeolocationService {
  Future<bool> get isLocationServiceEnabled;

  Future<GeolocationPermissionTypeEnum> checkPermission();
  Future<GeolocationPermissionTypeEnum> requestPermission();

  Future<GeolocationModel?> getGeolocation();

  Future<bool> openAppSettings();
  Future<bool> openLocationSettings();
}
