import 'package:weather_forecast_app/core/errors/base_exception.dart';

abstract class BaseState {}

class InitialState implements BaseState {}

class LoadingState implements BaseState {}

class OverlayLoadingState implements BaseState {
  final String? text;
  OverlayLoadingState({this.text});
}

class SuccessState<R> implements BaseState {
  final R data;
  SuccessState(this.data);
}

class ErrorState<T extends BaseException> implements BaseState {
  final T exception;
  ErrorState(this.exception);
}
