import 'dart:developer';

import 'package:weather_forecast_app/app/data/datasources/weather_datasource.dart';
import 'package:weather_forecast_app/app/domain/errors/errors.dart';
import 'package:weather_forecast_app/app/domain/repositories/weather_repository.dart';
import 'package:weather_forecast_app/app/domain/cubits/weather_cubit.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDatasource datasource;

  WeatherRepositoryImpl(this.datasource);

  @override
  Future<WeatherState> getWeather(num lat, num lng) async {
    try {
      final weather = await datasource.getWeatherData(lat, lng);
      return SuccessState(weather);
    } catch (e) {
      log('Error getWeather: ${e.toString()}');
      return ErrorState(Failure());
    }
  }
}
