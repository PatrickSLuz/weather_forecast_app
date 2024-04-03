import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_forecast_app/app/domain/errors/errors.dart';
import 'package:weather_forecast_app/app/domain/models/city_model.dart';
import 'package:weather_forecast_app/app/domain/repositories/geo_repository.dart';

part '../states/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GeoRepository geoRepository;

  SearchCubit(this.geoRepository) : super(SearchInitial());

  Future<void> searchCity(String text) async {
    emit(const SearchLoadingState());
    final newState = await geoRepository.searchCity(text);
    emit(newState);
  }
}
