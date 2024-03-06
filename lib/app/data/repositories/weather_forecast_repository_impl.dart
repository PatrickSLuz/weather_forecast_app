import 'package:weather_forecast_app/app/data/datasources/weather_forecast_datasource.dart';
import 'package:weather_forecast_app/app/domain/repositories/weather_forecast_repository.dart';
import 'package:weather_forecast_app/app/domain/cubits/weather_cubit.dart';

class WeatherForecastRepositoryImpl implements WeatherForecastRepository {
  final WeatherForecastDatasource datasource;

  WeatherForecastRepositoryImpl(this.datasource);

  @override
  Future<WeatherState> getWeatherForecast(num lat, num lng) async {
    try {
      final weather = await datasource.getWeatherData(lat, lng);
      return SuccessState(weather);
    } catch (e) {
      throw ErrorState(Exception());
    }
  }
}
