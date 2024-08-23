import 'package:geolocator/geolocator.dart';
import 'package:weather_forecast_app/app/data/services/app_geolocation_service.dart';
import 'package:weather_forecast_app/app/domain/models/enuns/geolocation_permission_type_enum.dart';
import 'package:weather_forecast_app/app/domain/models/geolocation_model.dart';

class GeolocatorService implements AppGeolocationService {
  @override
  Future<bool> get isLocationServiceEnabled {
    return Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<GeolocationPermissionTypeEnum> checkPermission() async {
    final permission = await Geolocator.checkPermission();
    return _convertPermissionType(permission);
  }

  @override
  Future<GeolocationPermissionTypeEnum> requestPermission() async {
    final permission = await Geolocator.requestPermission();
    return _convertPermissionType(permission);
  }

  @override
  Future<GeolocationModel?> getGeolocation() async {
    Position? position;

    try {
      position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          timeLimit: Duration(seconds: 5),
        ),
      );
    } catch (e) {
      position = await Geolocator.getLastKnownPosition();
    }

    if (position == null) return null;

    return GeolocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
      timestamp: position.timestamp,
    );
  }

  @override
  Future<bool> openAppSettings() {
    return Geolocator.openAppSettings();
  }

  @override
  Future<bool> openLocationSettings() {
    return Geolocator.openLocationSettings();
  }

  GeolocationPermissionTypeEnum _convertPermissionType(
    LocationPermission permission,
  ) {
    switch (permission) {
      case LocationPermission.denied:
        return GeolocationPermissionTypeEnum.denied;
      case LocationPermission.deniedForever:
        return GeolocationPermissionTypeEnum.deniedForever;
      case LocationPermission.whileInUse:
        return GeolocationPermissionTypeEnum.whileInUse;
      case LocationPermission.always:
        return GeolocationPermissionTypeEnum.always;
      case LocationPermission.unableToDetermine:
        return GeolocationPermissionTypeEnum.unableToDetermine;
    }
  }
}
