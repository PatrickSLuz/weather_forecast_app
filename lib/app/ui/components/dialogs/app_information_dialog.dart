import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/shared/theme/app_colors.dart';
import 'package:weather_forecast_app/app/ui/components/dialogs/widgets/dialog_action_widget.dart';
import 'package:weather_forecast_app/app/ui/components/dialogs/widgets/dialog_button_widget.dart';

class AppInformationDialog extends StatelessWidget {
  final String title;
  final String description;

  const AppInformationDialog({
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
          const Padding(
            padding: EdgeInsets.all(24),
            child: Center(
              child: Icon(
                Icons.info_outline_rounded,
                size: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 12),
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
          DialogActionWidget(
            primaryButton: DialogButtonWidget(
              text: 'OK',
              textColor: AppColors.darkBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: radius,
                bottomRight: radius,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
