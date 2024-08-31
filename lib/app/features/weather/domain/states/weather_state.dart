part of '../cubits/weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

class LoadingState implements WeatherState {
  const LoadingState();
}

class SuccessState implements WeatherState {
  final WeatherModel weather;
  const SuccessState(this.weather);
}

class ErrorState implements WeatherState {
  final Failure error;
  const ErrorState(this.error);
}
