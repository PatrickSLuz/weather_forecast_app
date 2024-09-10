import 'dart:developer';
import 'dart:io';

import 'package:weather_forecast_app/core/application_info/i_application_info.dart';
import 'package:weather_forecast_app/core/client/i_rest_client.dart';
import 'package:weather_forecast_app/core/client/rest_client_request.dart';

// TODO, implement after prodcution
class CheckUpdateAppService {
  final IApplicationInfo _appInfo;
  final IRestClient _restClient;

  CheckUpdateAppService(
    this._restClient,
    this._appInfo,
  );

  Future<bool> hasNewVersion() async {
    try {
      String? storeVersion;

      if (Platform.isIOS) {
        storeVersion = await _getIosStoreVersion();
      } else if (Platform.isAndroid) {
        storeVersion = await _getAndroidStoreVersion();
      } else {
        return false;
      }

      return _canUpdate(storeVersion);
    } catch (e) {
      log('Error hasNewVersion: ${e.toString()}');
      return false;
    }
  }

  bool _canUpdate(String? storeVersion) {
    if (storeVersion == null) return false;
    final local = _appInfo.version.split('.').map(int.parse).toList();
    final store = storeVersion.split('.').map(int.parse).toList();

    for (var i = 0; i < store.length; i++) {
      if (store[i] > local[i]) {
        return true;
      }

      if (local[i] > store[i]) {
        return false;
      }
    }

    return false;
  }

  Future<String?> _getIosStoreVersion() async {
    final response = await _restClient.get(
      RestClientRequest(
        baseUrl: 'https://itunes.apple.com',
        path: '/lookup',
        queryParameters: {'bundleId': _appInfo.packageName},
      ),
    );

    if (response.statusCode != 200) return null;

    final data = response.data;
    final List results = data['results'];
    if (results.isEmpty) return null;
    return _getCleanVersion(data['results'][0]['version']);
  }

  Future<String?> _getAndroidStoreVersion() async {
    final response = await _restClient.get(
      RestClientRequest(
        baseUrl: 'https://play.google.com',
        path: '/store/apps/details',
        queryParameters: {'id': _appInfo.packageName},
      ),
    );

    if (response.statusCode != 200) return null;

    final regexp = RegExp(
      r'\[\[\[\"(\d+\.\d+(\.[a-z]+)?(\.([^"]|\\")*)?)\"\]\]',
    );
    final storeVersion = regexp.firstMatch(response.data)?.group(1);
    return _getCleanVersion(storeVersion ?? '');
  }

  String _getCleanVersion(String version) {
    final regex = RegExp(r'\d+\.\d+(\.\d+)?');
    return regex.stringMatch(version) ?? '0.0.0';
  }
}
