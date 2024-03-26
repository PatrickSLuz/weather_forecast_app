import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/app/shared/extensions/num_extension.dart';
import 'package:weather_forecast_app/app/shared/extensions/string_extension.dart';

class WeatherForecastComponent extends StatelessWidget {
  final WeatherModel weather;

  const WeatherForecastComponent({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text('${weather.location.city}, ${weather.location.country}'),
          Text(weather.condition.description.capitalize()),
          Image.network(
            'https://openweathermap.org/img/wn/${weather.condition.iconId}@2x.png',
          ),
          Text('Temperatura Atual: ${weather.detail.temperature.toInt()} C°'),
          Text('Sensação Térmica: ${weather.detail.feelsLike.toInt()} C°'),
          Text('Mínima: ${weather.detail.tempMin.toInt()} C°'),
          Text('Máxima: ${weather.detail.tempMax.toInt()} C°'),
          Text('Humidade do ar: ${weather.detail.humidity.toInt()} %'),
          Text('Velocidade do vento: ${weather.wind.speed.inKmPerHour()} km/h'),
          Text('Direção do vento: ${weather.wind.compassDirection}'),
          Text(
              'Atualizado em: ${weather.currentDate.convertToDate(weather.location.timezone)}')
        ],
      ),
    );
  }
}
