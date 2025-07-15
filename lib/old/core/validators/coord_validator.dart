sealed class CoordValidator {
  static bool isValid(num? lat, num? lng) {
    if (lat == null || lat == 0) return false;
    if (lng == null || lng == 0) return false;
    return true;
  }
}
