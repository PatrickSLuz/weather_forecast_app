import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_forecast_app/app/shared/api/dio_interceptor.dart';
import 'package:weather_forecast_app/app/shared/environment/environment.dart';

class DioService {
  DioService._();

  static Dio setup() {
    log('- Dio setup');
    return Dio(
      BaseOptions(
        baseUrl: Environment.apiUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    )..interceptors.add(DioInterceptor.interceptorsWrapper);
  }
}
