import 'package:weather_forecast_app/app/features/weather/data/adapters/coordinate_adapter.dart';
import 'package:weather_forecast_app/app/features/weather/domain/models/location_model.dart';
import 'package:weather_forecast_app/core/functions/convert_num_to_date_function.dart';

class LocationAdapter {
  LocationAdapter._();

  static LocationModel fromMap(Map<String, dynamic> map) {
    return LocationModel(
      city: map['name'],
      country: map['country'] ?? '',
      timezone: map['timezone'],
      coordinate: CoordinateAdapter.fromMap(map['coord']),
      sunrise: convertNumToDateTime(map['sunrise'], map['timezone']),
      sunset: convertNumToDateTime(map['sunset'], map['timezone']),
    );
  }
}
