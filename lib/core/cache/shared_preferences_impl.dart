import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast_app/core/cache/i_cache.dart';

class SharedPreferencesImpl implements ICache {
  @override
  Future<dynamic> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.get(key);

    return result;
  }

  @override
  Future<bool> setData({required String key, required dynamic value}) async {
    final prefs = await SharedPreferences.getInstance();
    switch (value.runtimeType.toString()) {
      case 'String':
        return await prefs.setString(key, value);
      case 'int':
        return await prefs.setInt(key, value);
      case 'bool':
        return await prefs.setBool(key, value);
      case 'double':
        return await prefs.setDouble(key, value);
      case 'List<String>':
        return await prefs.setStringList(key, value);
    }
    return false;
  }

  @override
  Future<bool> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }
}
