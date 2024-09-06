import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onClose;

  const AppBackButton({
    super.key,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
        onClose?.call();
      },
      tooltip: 'Voltar',
      splashRadius: 16,
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.black87,
      ),
    );
  }
}
