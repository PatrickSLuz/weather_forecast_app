import 'package:dio/dio.dart';
import 'package:weather_forecast_app/core/client/dio/client_interceptor_dio_impl.dart';
import 'package:weather_forecast_app/core/client/dio/dio_adapter.dart';
import 'package:weather_forecast_app/core/client/i_client_interceptor.dart';
import 'package:weather_forecast_app/core/client/i_rest_client.dart';
import 'package:weather_forecast_app/core/client/rest_client_multipart.dart';
import 'package:weather_forecast_app/core/client/rest_client_request.dart';
import 'package:weather_forecast_app/core/client/rest_client_response.dart';
import 'package:weather_forecast_app/app/shared/env/environment.dart';

class DioFactory {
  static Dio setup({String baseUrl = ''}) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        validateStatus: (status) => true,
      ),
    );
  }

  static Dio weatherSetup() => setup(baseUrl: Environment.weatherApiUrl);
  static Dio geoSetup() => setup(baseUrl: Environment.geoApiUrl);
}

class RestClientDioImpl implements IRestClient {
  final Dio dio;

  final Map<IClientInterceptor, Interceptor> _interceptors = {};

  RestClientDioImpl(this.dio);

  @override
  void addInterceptors(IClientInterceptor interceptor) {
    _interceptors[interceptor] =
        ClientInterceptorDioImpl(interceptor: interceptor);
    dio.interceptors.add(_interceptors[interceptor]!);
  }

  @override
  void removeInterceptors(IClientInterceptor interceptor) {
    dio.interceptors.remove(_interceptors[interceptor]);
  }

  @override
  Future<RestClientResponse> upload(RestClientMultipart multipart) async {
    final formData = FormData.fromMap({
      multipart.fileKey: MultipartFile.fromBytes(
        multipart.fileBytes ?? [],
        filename: multipart.fileName,
      ),
    });

    final baseOptions = BaseOptions();

    final dio = Dio(baseOptions);
    final response = await dio.put(
      '${multipart.urlSuffix}${multipart.path}',
      data: formData,
    );

    return DioAdapter.toClientResponse(response);
  }

  @override
  Future<RestClientResponse> delete(RestClientRequest request) async {
    try {
      _handleBaseUrl(request);
      final response = await dio.delete(
        '${request.urlSuffix}${request.path}',
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  @override
  Future<RestClientResponse> get(RestClientRequest request) async {
    try {
      _handleBaseUrl(request);
      final response = await dio.get(
        '${request.urlSuffix}${request.path}',
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  @override
  Future<RestClientResponse> patch(RestClientRequest request) async {
    try {
      _handleBaseUrl(request);
      final response = await dio.patch(
        '${request.urlSuffix}${request.path}',
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  @override
  Future<RestClientResponse> post(RestClientRequest request) async {
    try {
      _handleBaseUrl(request);
      final response = await dio.post(
        '${request.urlSuffix}${request.path}',
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  @override
  Future<RestClientResponse> put(RestClientRequest request) async {
    try {
      _handleBaseUrl(request);
      final response = await dio.put(
        '${request.urlSuffix}${request.path}',
        data: request.data,
        queryParameters: request.queryParameters,
        options: Options(
          headers: request.headers,
        ),
      );
      return DioAdapter.toClientResponse(response);
    } on DioException catch (e) {
      throw DioAdapter.toClientException(e);
    }
  }

  void _handleBaseUrl(RestClientRequest request) {
    if (dio.options.baseUrl.isEmpty) {
      dio.options.baseUrl = request.baseUrl;
    }
  }
}
