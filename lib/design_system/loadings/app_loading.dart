import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  final bool withScaffold;

  const AppLoading({
    super.key,
    this.withScaffold = false,
  });

  Widget get loading => const Center(
        child: CircularProgressIndicator(),
      );

  @override
  Widget build(BuildContext context) {
    if (withScaffold) {
      return Scaffold(body: loading);
    }
    return loading;
  }
}
