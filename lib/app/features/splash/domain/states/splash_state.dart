part of '../cubits/splash_cubit.dart';

@immutable
sealed class SplashState {}

final class InitialState extends SplashState {}

final class LocationServiceDisbaledState extends SplashState {}

final class SuccessState extends SplashState {
  final GeolocationModel geolocation;
  SuccessState(this.geolocation);
}

final class ErrorState extends SplashState {
  ErrorState();
}
