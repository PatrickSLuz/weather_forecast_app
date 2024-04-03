import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/app/shared/assets/assets.dart';
import 'package:weather_forecast_app/app/shared/extensions/num_extension.dart';
import 'package:weather_forecast_app/app/shared/theme/app_colors.dart';
import 'package:weather_forecast_app/app/ui/weather/widgets/weather_data_card_widget.dart';

class WeatherDataScrollComponent extends StatelessWidget {
  final WeatherModel weather;

  const WeatherDataScrollComponent({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (weather.rain?.last1Hour != null)
            WeatherDataCardWidget(
              icon: const Icon(
                Icons.cloudy_snowing,
                color: AppColors.blue,
                size: 32,
              ),
              value: '${weather.rain!.last1Hour} mm',
              description: 'Chuva em 1 hora',
            ),
          if (weather.rain?.last1Hour != null) const SizedBox(width: 24),
          if (weather.rain?.last3Hour != null)
            WeatherDataCardWidget(
              icon: const Icon(
                Icons.cloudy_snowing,
                color: AppColors.blue,
                size: 32,
              ),
              value: '${weather.rain!.last3Hour} mm',
              description: 'Chuva em 3 horas',
            ),
          if (weather.rain?.last3Hour != null) const SizedBox(width: 24),
          WeatherDataCardWidget(
            icon: Image.asset(
              Assets.wind,
              height: 32,
              width: 32,
              color: AppColors.grey,
            ),
            value: '${weather.wind.speed.inKmPerHour()} km/h',
            description: 'Velocidade do vento',
          ),
          const SizedBox(width: 24),
          WeatherDataCardWidget(
            icon: Transform.rotate(
              angle: weather.wind.degrees.toRadians(),
              child: const Icon(
                Icons.navigation_rounded,
                color: AppColors.grey,
                size: 32,
              ),
            ),
            value: weather.wind.compassDirection,
            description: 'Direção do vento',
          ),
          const SizedBox(width: 24),
          WeatherDataCardWidget(
            icon: Image.asset(
              Assets.atmosphericPressure,
              height: 32,
              width: 32,
            ),
            value: '${weather.detail.pressure} hPa',
            description: 'Pressão atmosférica',
          ),
          const SizedBox(width: 24),
          WeatherDataCardWidget(
            icon: const Icon(
              Icons.remove_red_eye_rounded,
              color: AppColors.grey,
              size: 32,
            ),
            value: weather.visibilityFormatted,
            description: 'Visibilidade',
          ),
          const SizedBox(width: 24),
          WeatherDataCardWidget(
            icon: Image.asset(
              Assets.sunrise,
              height: 32,
              width: 32,
            ),
            value: weather.location.sunriseFormatted,
            description: 'Nascer do Sol',
          ),
          const SizedBox(width: 24),
          WeatherDataCardWidget(
            icon: Image.asset(
              Assets.sunset,
              height: 32,
              width: 32,
            ),
            value: weather.location.sunsetFormatted,
            description: 'Pôr do Sol',
          ),
        ],
      ),
    );
  }
}
