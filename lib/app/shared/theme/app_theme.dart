import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      constraints: BoxConstraints(maxHeight: 50),
      border: OutlineInputBorder(),
    ),
  );
}
