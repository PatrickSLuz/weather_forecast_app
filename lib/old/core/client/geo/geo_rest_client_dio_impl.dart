import 'package:weather_forecast_app/old/core/client/dio/rest_client_dio_impl.dart';
import 'package:weather_forecast_app/old/core/client/geo/i_geo_rest_client.dart';

class GeoRestClientDioImpl extends RestClientDioImpl implements IGeoRestClient {
  GeoRestClientDioImpl(super.dio);
}
