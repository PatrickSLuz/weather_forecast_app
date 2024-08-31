import 'dart:developer';

import 'package:weather_forecast_app/app/shared/datasources/geo_datasource.dart';
import 'package:weather_forecast_app/app/features/search/domain/cubits/search_cubit.dart';
import 'package:weather_forecast_app/app/shared/errors/errors.dart';
import 'package:weather_forecast_app/app/features/search/domain/repositories/geo_repository.dart';

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
