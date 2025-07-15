part of '../cubits/search_cubit.dart';

class SavedCitiesLoadedState implements BaseState {
  final List<CityModel> savedCities;
  const SavedCitiesLoadedState(this.savedCities);
}

class SearchSuccessState implements BaseState {
  final List<CityModel> cities;
  const SearchSuccessState(this.cities);
}

class GetLocationErrorState implements BaseState {
  const GetLocationErrorState();
}
