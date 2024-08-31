import 'package:get_it/get_it.dart';
import 'package:weather_forecast_app/app/shared/database/app_database.dart';
import 'package:weather_forecast_app/app/shared/database/sqflite/sqflite_database.dart';
import 'package:weather_forecast_app/app/features/search/data/repositories/city_repository_impl.dart';
import 'package:weather_forecast_app/app/features/search/data/repositories/geo_repository_impl.dart';
import 'package:weather_forecast_app/app/features/search/domain/repositories/i_city_repository.dart';
import 'package:weather_forecast_app/app/features/search/domain/repositories/i_geo_repository.dart';
import 'package:weather_forecast_app/app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_forecast_app/app/features/weather/domain/repositories/i_weather_repository.dart';
import 'package:weather_forecast_app/core/client/dio/rest_client_dio_impl.dart';
import 'package:weather_forecast_app/core/client/geo/geo_rest_client_dio_impl.dart';
import 'package:weather_forecast_app/core/client/geo/i_geo_rest_client.dart';
import 'package:weather_forecast_app/core/client/weather/i_weather_rest_client.dart';
import 'package:weather_forecast_app/core/client/weather/weather_rest_client_dio_impl.dart';
import 'package:weather_forecast_app/core/geolocation/geolocator_impl.dart';
import 'package:weather_forecast_app/core/geolocation/i_geolocation.dart';

final getIt = GetIt.instance;

void injector() {
  /// Geolocation package
  getIt.registerSingleton<IGeolocation>(GeolocatorImpl());

  /// Weather Rest Client
  getIt.registerSingleton<IWeatherRestClient>(
    WeatherRestClientDioImpl(DioFactory.weatherSetup()),
  );

  /// Geo Rest Client
  getIt.registerSingleton<IGeoRestClient>(
    GeoRestClientDioImpl(DioFactory.geoSetup()),
  );

  /// Weather Repository
  getIt.registerLazySingleton<IWeatherRepository>(
    () => WeatherRepositoryImpl(getIt<IWeatherRestClient>()),
  );

  /// Geo Repository
  getIt.registerLazySingleton<IGeoRepository>(
    () => GeoRepositoryImpl(getIt<IGeoRestClient>()),
  );

  getIt.registerLazySingleton<AppDatabase>(
    () => SqfliteDatabase(),
  );

  getIt.registerLazySingleton<ICityRepository>(
    () => CityRepositoryImpl(getIt<AppDatabase>()),
  );
}
