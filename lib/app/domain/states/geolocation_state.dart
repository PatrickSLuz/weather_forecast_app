part of '../cubits/geolocation_cubit.dart';

@immutable
sealed class GeolocationState {}

final class InitialState extends GeolocationState {}

final class LocationServiceDisbaledState extends GeolocationState {}

final class GeolocationSuccessState extends GeolocationState {
  final GeolocationModel geolocation;
  GeolocationSuccessState(this.geolocation);
}

final class GeolocationErrorState extends GeolocationState {
  final Failure error;
  GeolocationErrorState(this.error);
}
