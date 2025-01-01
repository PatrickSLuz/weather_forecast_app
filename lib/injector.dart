import 'package:get_it/get_it.dart';
import 'package:weather_forecast_app/app/shared/services/check_update_app_service.dart';
import 'package:weather_forecast_app/core/application_info/i_application_info.dart';
import 'package:weather_forecast_app/core/application_info/package_info_plus_impl.dart';
import 'package:weather_forecast_app/core/cache/i_cache.dart';
import 'package:weather_forecast_app/core/cache/shared_preferences_impl.dart';
import 'package:weather_forecast_app/core/client/geo/geo_client_interceptor_impl.dart';
import 'package:weather_forecast_app/core/client/i_rest_client.dart';
import 'package:weather_forecast_app/core/client/weather/weather_client_interceptor_impl.dart';
import 'package:weather_forecast_app/core/local_database/i_local_database.dart';
import 'package:weather_forecast_app/core/local_database/sqflite_local_database_impl.dart';
import 'package:weather_forecast_app/app/features/search/data/repositories/city_database_repository_impl.dart';
import 'package:weather_forecast_app/app/features/search/data/repositories/geo_repository_impl.dart';
import 'package:weather_forecast_app/app/features/search/domain/repositories/i_city_database_repository.dart';
import 'package:weather_forecast_app/app/features/search/domain/repositories/i_geo_repository.dart';
import 'package:weather_forecast_app/app/features/forecast/data/repositories/forecast_repository_impl.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/repositories/i_forecast_repository.dart';
import 'package:weather_forecast_app/core/client/dio/rest_client_dio_impl.dart';
import 'package:weather_forecast_app/core/client/geo/geo_rest_client_dio_impl.dart';
import 'package:weather_forecast_app/core/client/geo/i_geo_rest_client.dart';
import 'package:weather_forecast_app/core/client/weather/i_weather_rest_client.dart';
import 'package:weather_forecast_app/core/client/weather/weather_rest_client_dio_impl.dart';
import 'package:weather_forecast_app/core/geolocation/geolocator_impl.dart';
import 'package:weather_forecast_app/core/geolocation/i_geolocation.dart';
import 'package:weather_forecast_app/app/shared/services/firebase_message_service.dart';

final getIt = GetIt.instance;

void injector() {
  /// Application Info Package
  getIt.registerSingleton<IApplicationInfo>(PackageInfoPlusImpl());

  /// Cache package
  getIt.registerSingleton<ICache>(SharedPreferencesImpl());

  /// Geolocation package
  getIt.registerSingleton<IGeolocation>(GeolocatorImpl());

  /// Local Database Package
  getIt.registerSingleton<ILocalDatabase>(SqfliteLocalDatabaseImpl());

  /// Firebase Cloud Message Service
  getIt.registerSingleton<FirebaseMessageService>(
    FirebaseMessageService(getIt<ICache>()),
  );

  /// Empty Rest Client
  getIt.registerSingleton<IRestClient>(
    RestClientDioImpl(DioFactory.setup()),
  );

  /// Weather Rest Client
  getIt.registerSingleton<IWeatherRestClient>(
    WeatherRestClientDioImpl(DioFactory.weatherSetup()),
  );

  /// Geo Rest Client
  getIt.registerSingleton<IGeoRestClient>(
    GeoRestClientDioImpl(DioFactory.geoSetup()),
  );

  /// Check Update App Service
  getIt.registerSingleton<CheckUpdateAppService>(
    CheckUpdateAppService(getIt<IRestClient>(), getIt<IApplicationInfo>()),
  );

  /// Forecast Repository
  getIt.registerLazySingleton<IForecastRepository>(
    () => ForecastRepositoryImpl(getIt<IWeatherRestClient>()),
  );

  /// Geo Repository
  getIt.registerLazySingleton<IGeoRepository>(
    () => GeoRepositoryImpl(getIt<IGeoRestClient>()),
  );

  /// City Database Repository
  getIt.registerLazySingleton<ICityDatabaseRepository>(
    () => CityDatabaseRepositoryImpl(getIt<ILocalDatabase>()),
  );

  getIt<IWeatherRestClient>().addInterceptors(WeatherClientInterceptorImpl());
  getIt<IGeoRestClient>().addInterceptors(GeoClientInterceptorImpl());
}
