enum GeolocationPermissionTypeEnum {
  /// Permission to access the device's location is denied, the App should try
  /// to request permission using the `Geolocator.requestPermission()` method.
  denied,

  /// Permission to access the device's location is permenantly denied. When
  /// requestiong permissions the permission dialog will not been shown until
  /// the user updates the permission in the App settings.
  deniedForever,

  /// Permission to access the device's location is allowed only while
  /// the App is in use.
  whileInUse,

  /// Permission to access the device's location is allowed even when the
  /// App is running in the background.
  always,

  /// Permission status is cannot be determined. This permission is only
  /// returned on the web platform
  unableToDetermine
}

extension PermissionTypeEnumExtension on GeolocationPermissionTypeEnum {
  bool get isDenied => this == GeolocationPermissionTypeEnum.denied;

  bool get isDeniedForever =>
      this == GeolocationPermissionTypeEnum.deniedForever;

  bool get isWhileInUse => this == GeolocationPermissionTypeEnum.whileInUse;

  bool get isAlways => this == GeolocationPermissionTypeEnum.always;

  bool get isUnableToDetermine =>
      this == GeolocationPermissionTypeEnum.unableToDetermine;
}
