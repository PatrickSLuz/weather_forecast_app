import 'package:dio/dio.dart';
import 'package:weather_forecast_app/app/data/adapters/weather_adapter.dart';
import 'package:weather_forecast_app/app/interactor/models/weather_model.dart';
import 'package:weather_forecast_app/app/interactor/repositories/weather_forecast_repository.dart';

class OpenWeatherMapRepository implements WeatherForecastRepository {
  final Dio dio;

  OpenWeatherMapRepository(this.dio);

  @override
  Future<WeatherModel> getForecast(double lat, double lng) async {
    dio.options.queryParameters.addAll({'lat': lat, 'lon': lng});
    final response = await dio.get('/weather');

    if (response.statusCode == 200) {
      final weather = WeatherAdapter.fromMap(response.data);
      return weather;
    }

    throw Exception();
  }
}
