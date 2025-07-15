abstract class ICache {
  Future<bool> setData({required String key, required dynamic value});
  Future<dynamic> getData(String key);
  Future<bool> removeData(String key);
}
