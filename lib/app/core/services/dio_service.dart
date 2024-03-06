import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_forecast_app/app/core/services/dio/dio_interceptor.dart';

class DioService {
  DioService._();

  static Dio setup() {
    log('- Dio setup');
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/data/2.5/',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    )..interceptors.add(DioInterceptor.interceptorsWrapper);
  }
}
