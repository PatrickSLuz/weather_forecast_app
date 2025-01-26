import 'package:flutter/material.dart';
import 'package:weather_forecast_app/design_system/theme/app_colors.dart';
import 'package:weather_forecast_app/design_system/dialogs/widgets/dialog_action_widget.dart';
import 'package:weather_forecast_app/design_system/dialogs/widgets/dialog_button_widget.dart';
import 'package:weather_forecast_app/l10n/internationalization.dart';

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
          DialogActionWidget(
            primaryButton: DialogButtonWidget(
              onTap: () => Navigator.of(context).pop(true),
              text: AppIntl.of(context).remove,
              textColor: AppColors.darkBlue,
              borderRadius: BorderRadius.only(
                bottomRight: radius,
              ),
            ),
            secondaryButton: DialogButtonWidget(
              text: AppIntl.of(context).cancel,
              borderRadius: BorderRadius.only(
                bottomLeft: radius,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
