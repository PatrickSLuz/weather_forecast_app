extension NumExtension on num {
  String inKmPerHour() => (this * 3.6).toStringAsFixed(2);

  String convertToDate(num timezone) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(toInt() * 1000);

    final tz = timezone ~/ 3600;

    if (tz < 0) {
      date = date.subtract(Duration(hours: tz * -1));
    } else {
      date = date.add(Duration(hours: tz));
    }

    final day = date.day < 10 ? '0${date.day}' : date.day;
    final month = date.month < 10 ? '0${date.month}' : date.month;
    final year = date.year.toString().substring(2);
    final hour = date.hour < 10 ? '0${date.hour}' : date.hour;
    final minute = date.minute < 10 ? '0${date.minute}' : date.minute;

    return '$day/$month/$year $hour:$minute';
  }
}
