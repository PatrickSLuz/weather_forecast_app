import 'package:flutter/material.dart';
import 'package:weather_forecast_app/l10n/internationalization.dart';

class UseMyLocationTileWidget extends StatelessWidget {
  final VoidCallback onTap;

  const UseMyLocationTileWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            const Icon(Icons.location_on_outlined),
            const SizedBox(width: 12),
            Text(
              AppIntl.of(context).useMyLocation,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
