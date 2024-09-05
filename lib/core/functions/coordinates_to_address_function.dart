import 'package:geocoding/geocoding.dart';
import 'package:weather_forecast_app/core/models/address_model.dart';

Future<AddressModel?> coordinatesToAddress(num? lat, num? lng) async {
  try {
    if (lat == null || lng == null) return null;

    // await setLocaleIdentifier('pt_BR');

    final placemarks = await placemarkFromCoordinates(
      lat.toDouble(),
      lng.toDouble(),
    );

    return AddressModel(
      city: placemarks.first.subAdministrativeArea,
      state: placemarks.first.administrativeArea,
      postalCode: placemarks.first.postalCode,
      country: placemarks.first.country,
      isoCountryCode: placemarks.first.isoCountryCode,
    );
  } catch (e) {
    return null;
  }
}
