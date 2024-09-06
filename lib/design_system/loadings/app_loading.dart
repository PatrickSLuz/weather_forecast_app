import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  final bool withScaffold;
  final double size;
  final double strokeWidth;

  const AppLoading({
    super.key,
    this.withScaffold = false,
    this.size = 24,
    this.strokeWidth = 2.5,
  });

  Widget get loading => Center(
        child: SizedBox(
          height: size,
          width: size,
          child: CircularProgressIndicator(
            strokeWidth: strokeWidth,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    if (withScaffold) {
      return Scaffold(body: loading);
    }
    return loading;
  }
}
