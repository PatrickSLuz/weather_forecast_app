import 'dart:developer';

import 'package:weather_forecast_app/app/features/weather/data/adapters/forecast_adapter.dart';
import 'package:weather_forecast_app/app/features/weather/domain/models/forecast_model.dart';
import 'package:weather_forecast_app/app/features/weather/domain/repositories/i_weather_repository.dart';
import 'package:weather_forecast_app/core/client/rest_client_request.dart';
import 'package:weather_forecast_app/core/client/weather/i_weather_rest_client.dart';
import 'package:weather_forecast_app/core/errors/base_exception.dart';

const daysCount = 5;

class WeatherRepositoryImpl implements IWeatherRepository {
  final IWeatherRestClient restClient;

  WeatherRepositoryImpl(this.restClient);

  @override
  Future<ForecastModel?> getForecast(num? lat, num? lng) async {
    try {
      final response = await restClient.get(
        RestClientRequest(
          path: '/forecast',
          urlSuffix: '/data/2.5',
          queryParameters: {
            'lat': lat,
            'lon': lng,
            'cnt': daysCount,
            'units': 'metric',
          },
        ),
      );

      return ForecastAdapter.fromMap(response.data);
    } on BaseException {
      rethrow;
    } catch (e) {
      log('Error getWeather: ${e.toString()}');
      rethrow;
    }
  }
}
