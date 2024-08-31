import 'package:dio/dio.dart';
import 'package:weather_forecast_app/app/features/search/data/adapters/city_adapter.dart';
import 'package:weather_forecast_app/app/shared/datasources/geo_datasource.dart';
import 'package:weather_forecast_app/app/features/search/domain/models/city_model.dart';

class GeoApiFyDatasource implements GeoDatasource {
  final Dio dio;

  GeoApiFyDatasource(this.dio);

  @override
  Future<List<CityModel>> searchCity(String text) async {
    dio.options.queryParameters.addAll({
      'text': text,
      'type': 'city',
    });
    final response = await dio.get('/autocomplete');

    if (response.statusCode == 200) {
      final list = response.data['results'] as List;
      list.removeWhere((element) => element['city'] == null);
      final cities = list.map((map) => CityAdapter.fromMap(map)).toList();
      return cities;
    }

    throw Exception();
  }
}
