import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/location_model.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/weather_model.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/widgets/data_row_widget.dart';
import 'package:weather_forecast_app/design_system/assets/app_assets.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';
import 'package:weather_forecast_app/l10n/internationalization.dart';

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
            AppIntl.of(context).moreInformation,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 24),
          DataRowWidget(
            icon: Image.asset(
              AppAssets.atmosphericPressure,
              semanticLabel: AppIntl.of(context).pressure,
              height: 24,
              width: 24,
            ),
            data: '${weather.detail.pressure} hPa',
            description: AppIntl.of(context).pressure,
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
              description: AppIntl.of(context).visibility,
            ),
            const SizedBox(height: 16),
          ],
          DataRowWidget(
            icon: Image.asset(
              AppAssets.sunrise,
              semanticLabel: AppIntl.of(context).sunrise,
              height: 24,
              width: 24,
            ),
            data: DateFormat.Hm().format(location.sunrise),
            description: AppIntl.of(context).sunrise,
          ),
          const SizedBox(height: 16),
          DataRowWidget(
            icon: Image.asset(
              AppAssets.sunset,
              semanticLabel: AppIntl.of(context).sunset,
              height: 24,
              width: 24,
            ),
            data: DateFormat.Hm().format(location.sunset),
            description: AppIntl.of(context).sunset,
          ),
        ],
      ),
    );
  }
}
