import 'dart:math';

extension NumExtension on num {
  double toRadians() => this * pi / 180;

  String inKmPerHour() => (this * 3.6).toStringAsFixed(0);
}
