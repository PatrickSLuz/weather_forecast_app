import 'package:dio/dio.dart';
import 'package:weather_forecast_app/app/shared/api/dio_interceptor.dart';
import 'package:weather_forecast_app/environment.dart';

class DioService {
  DioService._();

  static Dio weatherSetup() {
    return Dio(
      BaseOptions(
        baseUrl: Environment.weatherApiUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    )..interceptors.add(DioInterceptor.weatherInterceptorsWrapper);
  }

  static Dio geoSetup() {
    return Dio(
      BaseOptions(
        baseUrl: Environment.geoApiUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    )..interceptors.add(DioInterceptor.geoInterceptorsWrapper);
  }
}
