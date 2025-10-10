import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/config/l10n/app_localizations.dart';

AppLocalizations get i10n => AppI10n.instance;

sealed class AppI10n {
  static late AppLocalizations _instance;
  static AppLocalizations get instance => _instance;

  static AppLocalizations of(BuildContext context) =>
      AppLocalizations.of(context)!;

  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      AppLocalizations.localizationsDelegates;

  static List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  static Future<void> setup() async {
    try {
      Intl.defaultLocale = Platform.localeName;

      final preferred = WidgetsBinding.instance.platformDispatcher.locales;
      const supported = AppLocalizations.supportedLocales;
      final locale = basicLocaleListResolution(preferred, supported);
      _instance = await AppLocalizations.delegate.load(locale);
    } catch (e, st) {
      log('Error setup locale: ', error: e, stackTrace: st);
    }
  }
}
