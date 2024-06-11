import 'package:flutter/material.dart';

class UseMyLocationTileWidget extends StatelessWidget {
  final VoidCallback onTap;

  const UseMyLocationTileWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Icon(Icons.location_on_outlined),
            SizedBox(width: 12),
            Text(
              'Usar minha localização',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
