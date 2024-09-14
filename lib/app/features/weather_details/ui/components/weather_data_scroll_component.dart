import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/location_model.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/weather_model.dart';
import 'package:weather_forecast_app/core/extensions/date_time_extension.dart';
import 'package:weather_forecast_app/design_system/assets/app_assets.dart';
import 'package:weather_forecast_app/core/extensions/num_extension.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/widgets/weather_data_card_widget.dart';

class WeatherDataScrollComponent extends StatelessWidget {
  final LocationModel location;
  final WeatherModel weather;

  const WeatherDataScrollComponent({
    super.key,
    required this.location,
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
          if (weather.rain?.last1Hour != null) ...[
            WeatherDataCardWidget(
              icon: const Icon(
                CupertinoIcons.cloud_rain,
                color: AppColors.blue,
                size: 32,
              ),
              value: '${weather.rain!.last1Hour} mm',
              description: 'Chuva em 1 hora',
            ),
            const SizedBox(width: 24),
          ],
          if (weather.rain?.last3Hour != null) ...[
            WeatherDataCardWidget(
              icon: const Icon(
                CupertinoIcons.cloud_rain,
                color: AppColors.blue,
                size: 32,
              ),
              value: '${weather.rain!.last3Hour} mm',
              description: 'Chuva em 3 horas',
            ),
            const SizedBox(width: 24),
          ],
          if (weather.wind.speed != 0) ...[
            WeatherDataCardWidget(
              icon: Image.asset(
                AppAssets.wind,
                semanticLabel: 'Vento',
                height: 32,
                width: 32,
                color: AppColors.grey,
              ),
              value: '${weather.wind.speed.inKmPerHour()} km/h',
              description: 'Velocidade do vento',
            ),
            const SizedBox(width: 24),
          ],
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
              AppAssets.atmosphericPressure,
              semanticLabel: 'Pressão atmosférica',
              height: 32,
              width: 32,
            ),
            value: '${weather.detail.pressure} hPa',
            description: 'Pressão atmosférica',
          ),
          const SizedBox(width: 24),
          if (weather.visibility != null) ...[
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
          ],
          WeatherDataCardWidget(
            icon: Image.asset(
              AppAssets.sunrise,
              semanticLabel: 'Nascer do sol',
              height: 32,
              width: 32,
            ),
            value: location.sunrise.format('HH:mm'),
            description: 'Nascer do Sol',
          ),
          const SizedBox(width: 24),
          WeatherDataCardWidget(
            icon: Image.asset(
              AppAssets.sunset,
              semanticLabel: 'Pôr do Sol',
              height: 32,
              width: 32,
            ),
            value: location.sunset.format('HH:mm'),
            description: 'Pôr do Sol',
          ),
        ],
      ),
    );
  }
}
