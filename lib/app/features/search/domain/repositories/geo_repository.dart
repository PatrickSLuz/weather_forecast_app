import 'package:weather_forecast_app/app/features/search/domain/cubits/search_cubit.dart';

abstract class GeoRepository {
  Future<SearchState> searchCity(String text);
}
