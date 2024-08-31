import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_forecast_app/app/features/search/domain/models/city_model.dart';
import 'package:weather_forecast_app/core/enuns/geolocation_permission_type_enum.dart';
import 'package:weather_forecast_app/core/geolocation/i_geolocation.dart';
import 'package:weather_forecast_app/core/models/geolocation_model.dart';
import 'package:weather_forecast_app/app/features/search/domain/repositories/i_city_repository.dart';
import 'package:weather_forecast_app/app/features/search/domain/repositories/i_geo_repository.dart';
import 'package:weather_forecast_app/core/errors/base_exception.dart';
import 'package:weather_forecast_app/core/errors/unknown_exception.dart';

part '../states/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final IGeoRepository geoRepository;
  final ICityRepository cityRepository;
  final IGeolocation geolocation;

  SearchCubit(
    this.geoRepository,
    this.cityRepository,
    this.geolocation,
  ) : super(SearchInitial()) {
    loadSavedCities();
  }

  Future<bool> canUse() async {
    final isServiceEnabled = await geolocation.isLocationServiceEnabled;
    if (!isServiceEnabled) return false;

    final permission = await geolocation.checkPermission();
    return permission.isAlways || permission.isWhileInUse;
  }

  Future<GeolocationModel?> getLocation() async {
    final currentState = state;
    emit(const SearchLoadingState());
    final location = await geolocation.getGeolocation();
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
    try {
      if (text.isEmpty) return loadSavedCities();
      if (text.length < 3) return;
      emit(const SearchLoadingState());

      final cities = await geoRepository.searchCity(text);

      return emit(SearchSuccessState(cities ?? []));
    } on BaseException catch (baseException) {
      log(baseException.message);
      emit(SearchErrorState(baseException));
    } catch (e) {
      log(e.toString());
      emit(const SearchErrorState(UnknownException()));
    }
  }
}
