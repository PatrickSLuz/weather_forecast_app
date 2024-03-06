import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast_app/app/shared/api/dio_service.dart';
import 'package:weather_forecast_app/app/data/datasources/open_weather_map/open_weather_map_datasource.dart';
import 'package:weather_forecast_app/app/data/repositories/weather_forecast_repository_impl.dart';

void main() {
  test('API test - open weather map repository', () async {
    final openWeatherMapRepository = WeatherForecastRepositoryImpl(
      OpenWeatherMapDatasource(DioService.setup()),
    );

    final response = await openWeatherMapRepository.getWeatherForecast(
      -25.4381591,
      -49.2691923,
    );

    log(response.toString());

    expect('', '');
  });
}
