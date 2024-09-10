import 'package:flutter/material.dart';
import 'package:weather_forecast_app/app/app_widget.dart';

class AppOverlayLoading {
  AppOverlayLoading._();

  static BuildContext? _context;

  static void show({BuildContext? context, String? text}) {
    if (_context != null) hide();

    _context = NavigatorService.key.currentContext ?? context;
    if (_context == null) return;

    showGeneralDialog(
      context: _context!,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 100),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return Transform.scale(
          scale: animation.value,
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: PopScope(
            canPop: false,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  if (text != null && text.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Text(
                      text,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void hide() {
    if (_context != null) {
      Navigator.of(_context!).pop();
    }
    _context = null;
  }
}
