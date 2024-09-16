import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/features/forecast/domain/models/rain_snow_model.dart';
import 'package:weather_forecast_app/app/features/weather_details/ui/widgets/data_row_widget.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';

class WeatherRainComponent extends StatelessWidget {
  final RainSnowModel rain;

  const WeatherRainComponent({
    super.key,
    required this.rain,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Dados sobre a chuva',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 24),
          if (rain.last1Hour != null) ...[
            DataRowWidget(
              icon: const Icon(
                CupertinoIcons.cloud_rain,
                color: AppColors.blue,
                size: 24,
              ),
              data: '${rain.last1Hour} mm',
              description: 'Volume de chuva na última hora',
            ),
            const SizedBox(height: 16),
          ],
          if (rain.last3Hour != null)
            DataRowWidget(
              icon: const Icon(
                CupertinoIcons.cloud_rain,
                color: AppColors.blue,
                size: 24,
              ),
              data: '${rain.last3Hour} mm',
              description: 'Volume de chuva nas últimas 3 horas',
            ),
        ],
      ),
    );
  }
}
