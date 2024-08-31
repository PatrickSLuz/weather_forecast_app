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

class ErrorState<T extends BaseException> implements WeatherState {
  final T exception;
  const ErrorState(this.exception);
}
