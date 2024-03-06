import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_forecast_app/app/core/services/dio/dio_service.dart';
import 'package:weather_forecast_app/app/data/datasources/open_weather_map/open_weather_map_datasource.dart';
import 'package:weather_forecast_app/app/data/datasources/weather_forecast_datasource.dart';
import 'package:weather_forecast_app/app/data/repositories/weather_forecast_repository_impl.dart';
import 'package:weather_forecast_app/app/domain/repositories/weather_forecast_repository.dart';

final getIt = GetIt.instance;

class DependencyInjectionService {
  DependencyInjectionService._();

  static void register() {
    log('- Dependency Injection register');
    getIt.registerSingleton<Dio>(DioService.setup());
    getIt.registerLazySingleton<WeatherForecastDatasource>(
      () => OpenWeatherMapDatasource(getIt<Dio>()),
    );
    getIt.registerLazySingleton<WeatherForecastRepository>(
      () => WeatherForecastRepositoryImpl(getIt<WeatherForecastDatasource>()),
    );
  }
}
