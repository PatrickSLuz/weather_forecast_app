import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/domain/models/weather_detail_model.dart';
import 'package:weather_forecast_app/app/shared/theme/app_colors.dart';

class TemperatureRowWidget extends StatelessWidget {
  final WeatherDetailModel weatherDetail;

  const TemperatureRowWidget({
    super.key,
    required this.weatherDetail,
  });

  double getFontSize(BuildContext context) {
    return MediaQuery.of(context).size.height <= 600 ? 40 : 48;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.flip(
              flipY: true,
              child: const Icon(
                Icons.straight_rounded,
                color: AppColors.blue,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '${weatherDetail.tempMin.toInt()}°',
              style: TextStyle(
                fontSize: getFontSize(context) / 2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Text(
          '${weatherDetail.temperature.toInt()}°',
          style: TextStyle(
            fontSize: getFontSize(context),
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.straight_rounded,
              color: AppColors.orange,
            ),
            const SizedBox(width: 4),
            Text(
              '${weatherDetail.tempMax.toInt()}°',
              style: TextStyle(
                fontSize: getFontSize(context) / 2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
