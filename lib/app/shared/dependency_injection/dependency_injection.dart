import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:weather_forecast_app/app/data/datasources/geo_datasource.dart';
import 'package:weather_forecast_app/app/data/datasources/geoapify/geoapify_datasource.dart';
import 'package:weather_forecast_app/app/data/repositories/geo_repository_impl.dart';
import 'package:weather_forecast_app/app/domain/repositories/geo_repository.dart';
import 'package:weather_forecast_app/app/shared/api/dio_service.dart';
import 'package:weather_forecast_app/app/data/datasources/open_weather_map/open_weather_map_datasource.dart';
import 'package:weather_forecast_app/app/data/datasources/weather_datasource.dart';
import 'package:weather_forecast_app/app/data/repositories/weather_repository_impl.dart';
import 'package:weather_forecast_app/app/domain/repositories/weather_repository.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  DependencyInjection._();

  static void register() {
    log('- Dependency Injection register');
    getIt.registerLazySingleton<WeatherDatasource>(
      () => OpenWeatherMapDatasource(DioService.weatherSetup()),
    );
    getIt.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(getIt<WeatherDatasource>()),
    );
    getIt.registerLazySingleton<GeoDatasource>(
      () => GeoApiFyDatasource(DioService.geoSetup()),
    );
    getIt.registerLazySingleton<GeoRepository>(
      () => GeoRepositoryImpl(getIt<GeoDatasource>()),
    );
  }
}
