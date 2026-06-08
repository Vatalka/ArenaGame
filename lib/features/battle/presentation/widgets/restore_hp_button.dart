import 'package:flutter/material.dart';

class RestoreHpButton extends StatelessWidget {
  final VoidCallback onTap;

  const RestoreHpButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
      ),
      onPressed: onTap,
      child: Icon(Icons.refresh, size: 24),
    );
  }
}
