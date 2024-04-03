import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/domain/models/city_model.dart';

class CityTileWidget extends StatelessWidget {
  final CityModel city;

  const CityTileWidget({
    super.key,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: [
          Text(
            city.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '${city.state}, ${city.countryCode.toUpperCase()}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
