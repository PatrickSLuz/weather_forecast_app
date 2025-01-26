import 'package:flutter/material.dart';
import 'package:weather_forecast_app/l10n/internationalization.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppIntl.of(context).defaultErrorTitle),
      ),
      body: Center(
        child: Text(AppIntl.of(context).errorPageMessage),
      ),
    );
  }
}
