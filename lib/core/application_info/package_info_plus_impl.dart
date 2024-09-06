import 'package:package_info_plus/package_info_plus.dart';
import 'package:weather_forecast_app/core/application_info/i_application_info.dart';

class PackageInfoPlusImpl implements IApplicationInfo {
  PackageInfo? _packageInfo;

  PackageInfoPlusImpl() {
    init();
  }

  @override
  Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  String get appName => _packageInfo?.appName ?? '';

  @override
  String get packageName => _packageInfo?.packageName ?? '';

  @override
  String get version => _packageInfo?.version ?? '';

  @override
  String get buildNumber => _packageInfo?.buildNumber ?? '';
}
