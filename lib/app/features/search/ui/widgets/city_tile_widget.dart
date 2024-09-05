import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/features/search/domain/models/city_model.dart';

class CityTileWidget extends StatelessWidget {
  final CityModel city;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final IconData icon;

  const CityTileWidget({
    super.key,
    required this.city,
    required this.onTap,
    this.onLongPress,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${city.state.isNotEmpty ? '${city.state}, ' : ''}${city.countryCode.toUpperCase()}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
