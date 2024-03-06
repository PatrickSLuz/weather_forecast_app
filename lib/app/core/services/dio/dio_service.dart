import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_forecast_app/app/core/services/dio/dio_interceptor.dart';
import 'package:weather_forecast_app/app/core/services/environment_service.dart';

class DioService {
  DioService._();

  static Dio setup() {
    log('- Dio setup');
    return Dio(
      BaseOptions(
        baseUrl: EnvironmentService.apiUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    )..interceptors.add(DioInterceptor.interceptorsWrapper);
  }
}
