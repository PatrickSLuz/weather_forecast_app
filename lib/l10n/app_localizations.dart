import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @locale.
  ///
  /// In en, this message translates to:
  /// **'en_US'**
  String get locale;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Current Weather'**
  String get appTitle;

  /// No description provided for @appLogoDescription.
  ///
  /// In en, this message translates to:
  /// **'Current Weather app logo'**
  String get appLogoDescription;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @searchCity.
  ///
  /// In en, this message translates to:
  /// **'Search a city'**
  String get searchCity;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Share app'**
  String get shareApp;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @weatherCondition.
  ///
  /// In en, this message translates to:
  /// **'Weather condition'**
  String get weatherCondition;

  /// No description provided for @useMyLocation.
  ///
  /// In en, this message translates to:
  /// **'Use my location'**
  String get useMyLocation;

  /// No description provided for @removeCity.
  ///
  /// In en, this message translates to:
  /// **'Remove city??'**
  String get removeCity;

  /// No description provided for @removeCityDesc.
  ///
  /// In en, this message translates to:
  /// **'{cityName} will be removed from your search history.'**
  String removeCityDesc(Object cityName);

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version: {value}'**
  String version(Object value);

  /// No description provided for @developedBy.
  ///
  /// In en, this message translates to:
  /// **'Developed by {name}'**
  String developedBy(Object name);

  /// No description provided for @forecastNextHours.
  ///
  /// In en, this message translates to:
  /// **'Forecast for the next few hours'**
  String get forecastNextHours;

  /// No description provided for @temperatureFeelsLike.
  ///
  /// In en, this message translates to:
  /// **'Feels like {value}'**
  String temperatureFeelsLike(Object value);

  /// No description provided for @humidity.
  ///
  /// In en, this message translates to:
  /// **'Humidity'**
  String get humidity;

  /// No description provided for @rain.
  ///
  /// In en, this message translates to:
  /// **'Rain'**
  String get rain;

  /// No description provided for @rainVolumeHours.
  ///
  /// In en, this message translates to:
  /// **'Rain volume in {count, plural, =1{1 hour} other{{count} hours}}'**
  String rainVolumeHours(num count);

  /// No description provided for @snow.
  ///
  /// In en, this message translates to:
  /// **'Snow'**
  String get snow;

  /// No description provided for @snowVolumeHours.
  ///
  /// In en, this message translates to:
  /// **'Snow volume in {count, plural, =1{1 hour} other{{count} hours}}'**
  String snowVolumeHours(num count);

  /// No description provided for @cloudiness.
  ///
  /// In en, this message translates to:
  /// **'Cloudiness'**
  String get cloudiness;

  /// No description provided for @rainData.
  ///
  /// In en, this message translates to:
  /// **'Rain data'**
  String get rainData;

  /// No description provided for @snowData.
  ///
  /// In en, this message translates to:
  /// **'Snow data'**
  String get snowData;

  /// No description provided for @windData.
  ///
  /// In en, this message translates to:
  /// **'Wind data'**
  String get windData;

  /// No description provided for @wind.
  ///
  /// In en, this message translates to:
  /// **'Wind'**
  String get wind;

  /// No description provided for @windSpeed.
  ///
  /// In en, this message translates to:
  /// **'Wind speed'**
  String get windSpeed;

  /// No description provided for @windGust.
  ///
  /// In en, this message translates to:
  /// **'Wind gust'**
  String get windGust;

  /// No description provided for @windDirection.
  ///
  /// In en, this message translates to:
  /// **'Wind direction'**
  String get windDirection;

  /// No description provided for @moreInformation.
  ///
  /// In en, this message translates to:
  /// **'More information'**
  String get moreInformation;

  /// No description provided for @pressure.
  ///
  /// In en, this message translates to:
  /// **'Pressure'**
  String get pressure;

  /// No description provided for @visibility.
  ///
  /// In en, this message translates to:
  /// **'Visibility'**
  String get visibility;

  /// No description provided for @sunrise.
  ///
  /// In en, this message translates to:
  /// **'Sunrise'**
  String get sunrise;

  /// No description provided for @sunset.
  ///
  /// In en, this message translates to:
  /// **'Sunset'**
  String get sunset;

  /// No description provided for @newVersion.
  ///
  /// In en, this message translates to:
  /// **'New version'**
  String get newVersion;

  /// No description provided for @newVersionDesc.
  ///
  /// In en, this message translates to:
  /// **'Update app for a better experience!'**
  String get newVersionDesc;

  /// No description provided for @notNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get notNow;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @errorPageMessage.
  ///
  /// In en, this message translates to:
  /// **'Invalid data on loading page.'**
  String get errorPageMessage;

  /// No description provided for @unknownPageMessage.
  ///
  /// In en, this message translates to:
  /// **'Unknown page.'**
  String get unknownPageMessage;

  /// No description provided for @defaultErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Opss!'**
  String get defaultErrorTitle;

  /// No description provided for @getLocationErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'We were unable to search your location. Please try again!'**
  String get getLocationErrorMessage;

  /// No description provided for @locationServiceDisbaledTitle.
  ///
  /// In en, this message translates to:
  /// **'Location service disbaled'**
  String get locationServiceDisbaledTitle;

  /// No description provided for @locationServiceDisbaledDescription.
  ///
  /// In en, this message translates to:
  /// **'It was not possible to use the device\'s current location, as the location service is disabled.\nFor a better experience on the App, activate location and try again!'**
  String get locationServiceDisbaledDescription;

  /// No description provided for @aboutAppDescription.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the Current Weather App. This app is your solution for accurate, real-time weather forecasts. With an intuitive interface, you can easily track current weather conditions and plan your day with confidence.\n\nOur mission is to provide accurate, easy-to-understand weather information to make your everyday life easier.\nWe aim to transform the way you plan and live by providing a reliable tool for all your weather needs.\n\nThank you for using the Current Weather App! Your feedback is important to us.'**
  String get aboutAppDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
