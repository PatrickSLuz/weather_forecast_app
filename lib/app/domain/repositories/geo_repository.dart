import 'package:weather_forecast_app/app/domain/cubits/search_cubit.dart';

abstract class GeoRepository {
  Future<SearchState> searchCity(String text);
}
