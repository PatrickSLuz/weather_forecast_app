import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_forecast_app/app/domain/errors/errors.dart';
import 'package:weather_forecast_app/app/domain/models/city_model.dart';
import 'package:weather_forecast_app/app/domain/repositories/city_repository.dart';
import 'package:weather_forecast_app/app/domain/repositories/geo_repository.dart';

part '../states/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GeoRepository geoRepository;
  final CityRepository cityRepository;

  SearchCubit(
    this.geoRepository,
    this.cityRepository,
  ) : super(SearchInitial()) {
    loadSavedCities();
  }

  Future<void> loadSavedCities() async {
    emit(const SearchLoadingState());
    final cities = await cityRepository.getAll();
    emit(SavedCitiesLoadedState(cities));
  }

  Future<void> saveCity(CityModel city) {
    return cityRepository.save(city);
  }

  Future<void> deleteCity(CityModel city) async {
    if (city.id == null) return;
    emit(const SearchLoadingState());
    await cityRepository.delete(city.id!);
    loadSavedCities();
  }

  Future<void> searchCity(String text) async {
    if (text.isEmpty) return emit(const SearchSuccessState([]));
    if (text.length < 3) return;
    emit(const SearchLoadingState());
    final newState = await geoRepository.searchCity(text);
    emit(newState);
  }
}
