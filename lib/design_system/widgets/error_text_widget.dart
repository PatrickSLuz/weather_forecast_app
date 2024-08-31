import 'package:flutter/material.dart';
import 'package:weather_forecast_app/core/errors/error_message.dart';

class ErrorTextWidget extends StatelessWidget {
  final String? text;

  const ErrorTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          text != null && text!.isNotEmpty ? text! : ErrorMessage.generic,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
