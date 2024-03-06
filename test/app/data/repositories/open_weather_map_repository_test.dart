import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast_app/app/core/services/dio_service.dart';
import 'package:weather_forecast_app/app/data/repositories/open_weather_map_repository.dart';

void main() {
  test('API test - open weather map repository', () async {
    final openWeatherMapRepository = OpenWeatherMapRepository(
      DioService.setup(),
    );

    final response = await openWeatherMapRepository.getForecast(
      -25.4381591,
      -49.2691923,
    );

    log(response.toString());

    expect('', '');
  });
}
