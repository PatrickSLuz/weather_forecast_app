import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:weather_forecast_app/config/constants/error_messages.dart';
import 'package:weather_forecast_app/data/exceptions/exceptions.dart';

Dio dioInstance(String baseUrl, [InterceptorsWrapper? interceptors]) {
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    validateStatus: (status) => true,
  ));

  if (interceptors != null) {
    dio.interceptors.add(interceptors);
  }

  return dio;
}

class OpenWeatherApiService extends ApiService {
  OpenWeatherApiService(super.dio);
}

class GeoApiService extends ApiService {
  GeoApiService(super.dio);
}

sealed class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  AsyncResult<Response> get(
    String path, {
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: parameters,
      );
      return Success(response);
    } on DioException catch (e, s) {
      return Failure(ApiException(e.message ?? ErrorMessage.generic, s));
    } catch (e, s) {
      return Failure(ApiException(e.toString(), s));
    }
  }

  AsyncResult<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: parameters,
      );
      return Success(response);
    } on DioException catch (e, s) {
      return Failure(ApiException(e.message ?? ErrorMessage.generic, s));
    } catch (e, s) {
      return Failure(ApiException(e.toString(), s));
    }
  }

  AsyncResult<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: parameters,
      );
      return Success(response);
    } on DioException catch (e, s) {
      return Failure(ApiException(e.message ?? ErrorMessage.generic, s));
    } catch (e, s) {
      return Failure(ApiException(e.toString(), s));
    }
  }

  AsyncResult<Response> delete(
    String path, {
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: parameters,
      );
      return Success(response);
    } on DioException catch (e, s) {
      return Failure(ApiException(e.message ?? ErrorMessage.generic, s));
    } catch (e, s) {
      return Failure(ApiException(e.toString(), s));
    }
  }
}
