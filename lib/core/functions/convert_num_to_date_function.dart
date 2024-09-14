DateTime convertNumToDateTime(num? dateNum, num timezone) {
  try {
    if (dateNum == null || dateNum == 0) return DateTime.now();

    final tz = timezone ~/ 3600;
    final sinceEpoch = dateNum.toInt() * 1000;

    DateTime date = DateTime.fromMillisecondsSinceEpoch(sinceEpoch).toUtc();

    if (tz < 0) {
      date = date.subtract(Duration(hours: tz * -1));
    } else {
      date = date.add(Duration(hours: tz));
    }

    return date;
  } catch (e) {
    return DateTime.now();
  }
}
