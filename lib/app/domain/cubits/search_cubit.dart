import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_forecast_app/app/data/services/app_geolocation_service.dart';
import 'package:weather_forecast_app/app/domain/errors/errors.dart';
import 'package:weather_forecast_app/app/domain/models/city_model.dart';
import 'package:weather_forecast_app/app/domain/models/enuns/geolocation_permission_type_enum.dart';
import 'package:weather_forecast_app/app/domain/models/geolocation_model.dart';
import 'package:weather_forecast_app/app/domain/repositories/city_repository.dart';
import 'package:weather_forecast_app/app/domain/repositories/geo_repository.dart';

part '../states/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GeoRepository geoRepository;
  final CityRepository cityRepository;
  final AppGeolocationService geolocationService;

  SearchCubit(
    this.geoRepository,
    this.cityRepository,
    this.geolocationService,
  ) : super(SearchInitial()) {
    loadSavedCities();
  }

  Future<bool> canUse() async {
    final isServiceEnabled = await geolocationService.isLocationServiceEnabled;
    if (!isServiceEnabled) return false;

    final permission = await geolocationService.checkPermission();
    return permission.isAlways || permission.isWhileInUse;
  }

  Future<GeolocationModel?> getLocation() async {
    final currentState = state;
    emit(const SearchLoadingState());
    final location = await geolocationService.getGeolocation();
    if (location == null) {
      emit(const GetLocationErrorState());
      emit(currentState);
    }
    return location;
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
    if (text.isEmpty) return loadSavedCities();
    if (text.length < 3) return;
    emit(const SearchLoadingState());
    final newState = await geoRepository.searchCity(text);
    emit(newState);
  }
}
