import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_forecast_app/app/core/services/dio_service.dart';
import 'package:weather_forecast_app/app/data/repositories/open_weather_map_repository.dart';

final getIt = GetIt.instance;

class DependencyInjectionService {
  DependencyInjectionService._();

  static void register() {
    log('- Dependency Injection register');
    getIt.registerSingleton<Dio>(DioService.setup());
    getIt.registerLazySingleton<OpenWeatherMapRepository>(
      () => OpenWeatherMapRepository(getIt<Dio>()),
    );
  }
}
