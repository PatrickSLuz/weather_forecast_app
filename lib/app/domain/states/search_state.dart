part of '../cubits/search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoadingState implements SearchState {
  const SearchLoadingState();
}

class SavedCitiesLoadedState implements SearchState {
  final List<CityModel> savedCities;
  const SavedCitiesLoadedState(this.savedCities);
}

class SearchSuccessState implements SearchState {
  final List<CityModel> cities;
  const SearchSuccessState(this.cities);
}

class SearchErrorState implements SearchState {
  final Failure error;
  const SearchErrorState(this.error);
}
