import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  final bool withScaffold;
  final bool withCenter;
  final double size;
  final double strokeWidth;
  final Color? color;

  const AppLoading({
    super.key,
    this.withScaffold = false,
    this.withCenter = true,
    this.size = 24,
    this.strokeWidth = 2.5,
    this.color,
  });

  Widget get loading {
    final widget = SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor:
            color != null ? AlwaysStoppedAnimation<Color>(color!) : null,
      ),
    );
    if (withCenter) return Center(child: widget);
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    if (withScaffold) {
      return Scaffold(body: loading);
    }
    return loading;
  }
}
