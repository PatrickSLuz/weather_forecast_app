import 'package:flutter/material.dart';
import 'package:weather_forecast_app/l10n/internationalization.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onClose;

  const AppBackButton({
    super.key,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
        onClose?.call();
      },
      tooltip: AppIntl.of(context).back,
      splashRadius: 16,
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.black87,
      ),
    );
  }
}
