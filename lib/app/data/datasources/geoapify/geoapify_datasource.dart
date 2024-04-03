import 'package:dio/dio.dart';
import 'package:weather_forecast_app/app/data/adapters/city_adapter.dart';
import 'package:weather_forecast_app/app/data/datasources/geo_datasource.dart';
import 'package:weather_forecast_app/app/domain/models/city_model.dart';

class GeoApiFyDatasource implements GeoDatasource {
  final Dio dio;

  GeoApiFyDatasource(this.dio);

  @override
  Future<List<CityModel>> searchCity(String text) async {
    dio.options.queryParameters.addAll({
      'text': text,
    });
    final response = await dio.get('/autocomplete');

    if (response.statusCode == 200) {
      final list = response.data['features'] as List;
      final cities = list.map((map) => CityAdapter.fromMap(map)).toList();
      return cities;
    }

    throw Exception();
  }
}
