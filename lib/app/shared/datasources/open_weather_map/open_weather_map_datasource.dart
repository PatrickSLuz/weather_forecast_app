import 'package:dio/dio.dart';
import 'package:weather_forecast_app/app/features/weather/data/adapters/weather_adapter.dart';
import 'package:weather_forecast_app/app/shared/datasources/weather_datasource.dart';
import 'package:weather_forecast_app/app/features/weather/domain/models/weather_model.dart';

class OpenWeatherMapDatasource implements WeatherDatasource {
  final Dio dio;

  OpenWeatherMapDatasource(this.dio);

  @override
  Future<WeatherModel> getWeatherData(num lat, num lng) async {
    dio.options.queryParameters.addAll({
      'lat': lat,
      'lon': lng,
      'units': 'metric',
    });
    final response = await dio.get('/weather');

    if (response.statusCode == 200) {
      final weather = WeatherAdapter.fromMap(response.data);
      return weather;
    }

    throw Exception();
  }
}
