import 'package:flutter/material.dart';

class DialogButtonWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  const DialogButtonWidget({
    super.key,
    required this.text,
    this.textColor = Colors.black54,
    this.onTap,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? Navigator.of(context).pop,
      borderRadius: borderRadius,
      child: SizedBox(
        height: 48,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
