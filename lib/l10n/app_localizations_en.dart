// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get locale => 'en_US';

  @override
  String get appTitle => 'Current Weather';

  @override
  String get appLogoDescription => 'Current Weather app logo';

  @override
  String get home => 'Home';

  @override
  String get searchCity => 'Search a city';

  @override
  String get shareApp => 'Share app';

  @override
  String get about => 'About';

  @override
  String get search => 'Search';

  @override
  String get menu => 'Menu';

  @override
  String get weatherCondition => 'Weather condition';

  @override
  String get useMyLocation => 'Use my location';

  @override
  String get removeCity => 'Remove city??';

  @override
  String removeCityDesc(Object cityName) {
    return '$cityName will be removed from your search history.';
  }

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String version(Object value) {
    return 'Version: $value';
  }

  @override
  String developedBy(Object name) {
    return 'Developed by $name';
  }

  @override
  String get forecastNextHours => 'Forecast for the next few hours';

  @override
  String temperatureFeelsLike(Object value) {
    return 'Feels like $value';
  }

  @override
  String get humidity => 'Humidity';

  @override
  String get rain => 'Rain';

  @override
  String rainVolumeHours(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours',
      one: '1 hour',
    );
    return 'Rain volume in $_temp0';
  }

  @override
  String get snow => 'Snow';

  @override
  String snowVolumeHours(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours',
      one: '1 hour',
    );
    return 'Snow volume in $_temp0';
  }

  @override
  String get cloudiness => 'Cloudiness';

  @override
  String get rainData => 'Rain data';

  @override
  String get snowData => 'Snow data';

  @override
  String get windData => 'Wind data';

  @override
  String get wind => 'Wind';

  @override
  String get windSpeed => 'Wind speed';

  @override
  String get windGust => 'Wind gust';

  @override
  String get windDirection => 'Wind direction';

  @override
  String get moreInformation => 'More information';

  @override
  String get pressure => 'Pressure';

  @override
  String get visibility => 'Visibility';

  @override
  String get sunrise => 'Sunrise';

  @override
  String get sunset => 'Sunset';

  @override
  String get newVersion => 'New version';

  @override
  String get newVersionDesc => 'Update app for a better experience!';

  @override
  String get notNow => 'Not now';

  @override
  String get update => 'Update';

  @override
  String get remove => 'Remove';

  @override
  String get cancel => 'Cancel';

  @override
  String get back => 'Back';

  @override
  String get ok => 'Ok';

  @override
  String get errorPageMessage => 'Invalid data on loading page.';

  @override
  String get unknownPageMessage => 'Unknown page.';

  @override
  String get defaultErrorTitle => 'Opss!';

  @override
  String get getLocationErrorMessage => 'We were unable to search your location. Please try again!';

  @override
  String get locationServiceDisbaledTitle => 'Location service disbaled';

  @override
  String get locationServiceDisbaledDescription => 'It was not possible to use the device\'s current location, as the location service is disabled.\nFor a better experience on the App, activate location and try again!';

  @override
  String get aboutAppDescription => 'Welcome to the Current Weather App. This app is your solution for accurate, real-time weather forecasts. With an intuitive interface, you can easily track current weather conditions and plan your day with confidence.\n\nOur mission is to provide accurate, easy-to-understand weather information to make your everyday life easier.\nWe aim to transform the way you plan and live by providing a reliable tool for all your weather needs.\n\nThank you for using the Current Weather App! Your feedback is important to us.';
}
