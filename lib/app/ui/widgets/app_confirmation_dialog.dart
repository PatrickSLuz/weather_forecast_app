import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/shared/theme/app_colors.dart';

class AppConfirmationDialog extends StatelessWidget {
  final String title;
  final String description;

  const AppConfirmationDialog({
    super.key,
    required this.title,
    required this.description,
  });

  Radius get radius => const Radius.circular(16);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(radius),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(
            color: AppColors.lightGrey,
            height: 0,
            thickness: 0.5,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: Navigator.of(context).pop,
                  borderRadius: BorderRadius.only(
                    bottomLeft: radius,
                  ),
                  child: const SizedBox(
                    height: 48,
                    child: Center(
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: AppColors.lightGrey,
                height: 48,
                width: 0.5,
              ),
              Expanded(
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(true),
                  borderRadius: BorderRadius.only(
                    bottomRight: radius,
                  ),
                  child: const SizedBox(
                    height: 48,
                    child: Center(
                      child: Text(
                        'Remover',
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
