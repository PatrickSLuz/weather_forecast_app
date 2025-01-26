import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/app/app_widget.dart';

sealed class AppIntl {
  static AppLocalizations of(BuildContext context) =>
      AppLocalizations.of(context)!;

  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      AppLocalizations.localizationsDelegates;

  static List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  static void setupLocale(BuildContext context) {
    try {
      Intl.defaultLocale = of(context).locale;
    } catch (e, st) {
      log('Error setup locale: ', error: e, stackTrace: st);
    }
  }

  static String get currentLocale {
    try {
      final context = NavigatorService.key.currentContext;
      if (context == null) return 'en_US';
      return of(context).locale;
    } catch (e, st) {
      log('Error getting current locale: ', error: e, stackTrace: st);
      return 'en_US';
    }
  }
}
