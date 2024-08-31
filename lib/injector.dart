import 'package:get_it/get_it.dart';
import 'package:weather_forecast_app/app/shared/database/app_database.dart';
import 'package:weather_forecast_app/app/shared/database/sqflite/sqflite_database.dart';
import 'package:weather_forecast_app/app/shared/datasources/geo_datasource.dart';
import 'package:weather_forecast_app/app/shared/datasources/geoapify/geoapify_datasource.dart';
import 'package:weather_forecast_app/app/features/search/data/repositories/city_repository_impl.dart';
import 'package:weather_forecast_app/app/features/search/domain/models/geo_repository_impl.dart';
import 'package:weather_forecast_app/app/shared/services/app_geolocation_service.dart';
import 'package:weather_forecast_app/app/shared/services/geolocator/geolocator_service.dart';
import 'package:weather_forecast_app/app/features/search/domain/repositories/i_city_repository.dart';
import 'package:weather_forecast_app/app/features/search/domain/repositories/geo_repository.dart';
import 'package:weather_forecast_app/app/shared/api/dio_service.dart';
import 'package:weather_forecast_app/app/shared/datasources/open_weather_map/open_weather_map_datasource.dart';
import 'package:weather_forecast_app/app/shared/datasources/weather_datasource.dart';
import 'package:weather_forecast_app/app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_forecast_app/app/features/weather/domain/repositories/i_weather_repository.dart';
import 'package:weather_forecast_app/core/client/dio/rest_client_dio_impl.dart';
import 'package:weather_forecast_app/core/client/weather/i_weather_rest_client.dart';
import 'package:weather_forecast_app/core/client/weather/weather_rest_client_dio_impl.dart';

final getIt = GetIt.instance;

void injector() {
  getIt.registerLazySingleton<AppGeolocationService>(
    () => GeolocatorService(),
  );
  getIt.registerLazySingleton<WeatherDatasource>(
    () => OpenWeatherMapDatasource(DioService.weatherSetup()),
  );

  /// Weather Rest Client
  getIt.registerLazySingleton<IWeatherRestClient>(
    () => WeatherRestClientDioImpl(DioFactory.weatherSetup()),
  );

  /// Weather Repository
  getIt.registerLazySingleton<IWeatherRepository>(
    () => WeatherRepositoryImpl(getIt<IWeatherRestClient>()),
  );
  getIt.registerLazySingleton<GeoDatasource>(
    () => GeoApiFyDatasource(DioService.geoSetup()),
  );
  getIt.registerLazySingleton<GeoRepository>(
    () => GeoRepositoryImpl(getIt<GeoDatasource>()),
  );
  getIt.registerLazySingleton<AppDatabase>(
    () => SqfliteDatabase(),
  );
  getIt.registerLazySingleton<ICityRepository>(
    () => CityRepositoryImpl(getIt<AppDatabase>()),
  );
}
