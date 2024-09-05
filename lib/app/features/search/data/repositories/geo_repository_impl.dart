import 'dart:developer';

import 'package:weather_forecast_app/app/features/search/data/adapters/city_adapter.dart';
import 'package:weather_forecast_app/app/features/search/domain/models/city_model.dart';
import 'package:weather_forecast_app/app/features/search/domain/repositories/i_geo_repository.dart';
import 'package:weather_forecast_app/core/client/geo/i_geo_rest_client.dart';
import 'package:weather_forecast_app/core/client/rest_client_request.dart';
import 'package:weather_forecast_app/core/errors/base_exception.dart';
import 'package:weather_forecast_app/core/errors/unknown_exception.dart';

class GeoRepositoryImpl implements IGeoRepository {
  final IGeoRestClient restClient;

  GeoRepositoryImpl(this.restClient);

  @override
  Future<List<CityModel>?> searchCity(String text) async {
    try {
      final response = await restClient.get(
        RestClientRequest(
          path: '/autocomplete',
          queryParameters: {
            'text': text,
            'type': 'city',
          },
        ),
      );

      if (response.statusCode == 200) {
        final list = response.data['results'] as List;
        list.removeWhere((element) => element['city'] == null);
        final cities = list.map((map) => CityAdapter.fromMapGeo(map)).toList();
        return cities;
      }

      throw const UnknownException();
    } on BaseException {
      rethrow;
    } catch (e) {
      log('Error searchCity: ${e.toString()}');
      rethrow;
    }
  }
}
