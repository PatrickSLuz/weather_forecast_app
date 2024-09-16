import 'package:flutter/material.dart';

class DataRowWidget extends StatelessWidget {
  final Widget icon;
  final String data;
  final String description;

  const DataRowWidget({
    super.key,
    required this.icon,
    required this.data,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        const SizedBox(width: 16),
        Text(
          '$description: ',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.black87),
        ),
        Text(
          data,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
