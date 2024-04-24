import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/shared/theme/app_colors.dart';
import 'package:weather_forecast_app/app/ui/components/dialogs/widgets/dialog_button_widget.dart';

class DialogActionWidget extends StatelessWidget {
  final DialogButtonWidget primaryButton;
  final DialogButtonWidget? secondaryButton;

  const DialogActionWidget({
    super.key,
    required this.primaryButton,
    this.secondaryButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: AppColors.lightGrey,
          height: 0,
          thickness: 0.5,
        ),
        Row(
          children: [
            if (secondaryButton != null) ...[
              Expanded(child: secondaryButton!),
              Container(
                color: AppColors.lightGrey,
                height: 48,
                width: 0.5,
              ),
            ],
            Expanded(child: primaryButton),
          ],
        ),
      ],
    );
  }
}
