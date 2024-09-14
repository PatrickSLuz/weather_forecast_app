import 'dart:math';

import 'package:intl/intl.dart';

extension NumExtension on num {
  double toRadians() => this * pi / 180;

  String inKmPerHour() => (this * 3.6).toStringAsFixed(0);

  DateTime toDate(num timezone) {
    return DateTime.fromMillisecondsSinceEpoch(toInt() * 1000).toUtc();
  }

  String formatToDate(num timezone, [String pattern = 'dd/MM/yy HH:mm']) {
    DateTime date = toDate(timezone);

    final tz = timezone ~/ 3600;

    if (tz < 0) {
      date = date.subtract(Duration(hours: tz * -1));
    } else {
      date = date.add(Duration(hours: tz));
    }

    return DateFormat(pattern).format(date);
  }
}
