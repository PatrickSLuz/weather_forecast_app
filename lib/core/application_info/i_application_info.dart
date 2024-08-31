abstract interface class IApplicationInfo {
  Future<void> init();
  String get appName;
  String get packageName;
  String get version;
  String get buildNumber;
}
