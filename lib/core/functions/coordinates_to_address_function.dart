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

    final placemark = placemarks.first;

    final city = placemark.subAdministrativeArea != null &&
            placemark.subAdministrativeArea!.isNotEmpty
        ? placemark.subAdministrativeArea
        : placemark.locality;

    return AddressModel(
      city: city,
      state: placemark.administrativeArea,
      postalCode: placemark.postalCode,
      country: placemark.country,
      isoCountryCode: placemark.isoCountryCode,
    );
  } catch (e) {
    return null;
  }
}
