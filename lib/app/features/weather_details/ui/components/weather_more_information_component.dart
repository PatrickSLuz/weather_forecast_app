import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/location_model.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/weather_model.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/widgets/data_row_widget.dart';
import 'package:weather_forecast_app/core/extensions/date_time_extension.dart';
import 'package:weather_forecast_app/design_system/assets/app_assets.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';

class WeatherMoreInformationComponent extends StatelessWidget {
  final LocationModel location;
  final WeatherModel weather;

  const WeatherMoreInformationComponent({
    super.key,
    required this.location,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Mais informações',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 24),
          DataRowWidget(
            icon: Image.asset(
              AppAssets.atmosphericPressure,
              semanticLabel: 'Pressão atmosférica',
              height: 24,
              width: 24,
            ),
            data: '${weather.detail.pressure} hPa',
            description: 'Pressão atmosférica',
          ),
          const SizedBox(height: 16),
          // DataRowWidget(
          //   icon: Image.asset(
          //     AppAssets.atmosphericPressure,
          //     semanticLabel: 'Pressão atmosférica',
          //     height: 24,
          //     width: 24,
          //   ),
          //   data: '${weather.detail.seaLevel} hPa',
          //   description: 'Pressão atmosférica ao nível do mar',
          // ),
          // const SizedBox(height: 16),
          // DataRowWidget(
          //   icon: Image.asset(
          //     AppAssets.atmosphericPressure,
          //     semanticLabel: 'Pressão atmosférica',
          //     height: 24,
          //     width: 24,
          //   ),
          //   data: '${weather.detail.groundLevel} hPa',
          //   description: 'Pressão atmosférica ao nível do solo',
          // ),
          // const SizedBox(height: 16),
          if (weather.visibility != null) ...[
            DataRowWidget(
              icon: const Icon(
                Icons.remove_red_eye_rounded,
                color: AppColors.grey,
                size: 24,
              ),
              data: weather.visibilityFormatted,
              description: 'Visibilidade',
            ),
            const SizedBox(height: 16),
          ],
          DataRowWidget(
            icon: Image.asset(
              AppAssets.sunrise,
              semanticLabel: 'Nascer do sol',
              height: 24,
              width: 24,
            ),
            data: location.sunrise.format('HH:mm'),
            description: 'Nascer do Sol',
          ),
          const SizedBox(height: 16),
          DataRowWidget(
            icon: Image.asset(
              AppAssets.sunset,
              semanticLabel: 'Pôr do Sol',
              height: 24,
              width: 24,
            ),
            data: location.sunset.format('HH:mm'),
            description: 'Pôr do Sol',
          ),
        ],
      ),
    );
  }
}
