import 'dart:developer';

import 'package:weather_forecast_app/app/data/datasources/geo_datasource.dart';
import 'package:weather_forecast_app/app/domain/cubits/search_cubit.dart';
import 'package:weather_forecast_app/app/domain/errors/errors.dart';
import 'package:weather_forecast_app/app/domain/repositories/geo_repository.dart';

class GeoRepositoryImpl implements GeoRepository {
  final GeoDatasource datasource;

  GeoRepositoryImpl(this.datasource);

  @override
  Future<SearchState> searchCity(String text) async {
    try {
      final cities = await datasource.searchCity(text);
      return SearchSuccessState(cities);
    } catch (e) {
      log('Error searchCity: ${e.toString()}');
      return SearchErrorState(Failure());
    }
  }
}
