import 'package:dio/dio.dart';
import 'package:weather_forecast_app/core/client/dio/dio_adapter.dart';
import 'package:weather_forecast_app/core/client/i_client_interceptor.dart';
import 'package:weather_forecast_app/core/client/rest_client_exception.dart';
import 'package:weather_forecast_app/core/client/rest_client_request.dart';
import 'package:weather_forecast_app/core/client/rest_client_response.dart';

class ClientInterceptorDioImpl implements Interceptor {
  final IClientInterceptor interceptor;

  ClientInterceptorDioImpl({required this.interceptor});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final restClientHttp = DioAdapter.toClientException(err);
    final message = await interceptor.onError(restClientHttp);

    if (message is RestClientException) {
      handler.next(DioAdapter.toDioException(message));
    } else if (message is RestClientResponse) {
      handler.resolve(DioAdapter.toResponse(message));
    }
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final restRequest = DioAdapter.toClientRequest(options);
    final message = await interceptor.onRequest(restRequest);

    if (message is RestClientException) {
      handler.reject(DioAdapter.toDioException(message));
    } else if (message is RestClientRequest) {
      handler.next(DioAdapter.toRequestOptions(message));
    } else if (message is RestClientResponse) {
      handler.resolve(DioAdapter.toResponse(message));
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final restResponse = DioAdapter.toClientResponse(response);
    final message = await interceptor.onResponse(restResponse);

    if (message is RestClientException) {
      handler.reject(DioAdapter.toDioException(message));
    } else if (message is RestClientResponse) {
      handler.next(DioAdapter.toResponse(message));
    }
  }
}
