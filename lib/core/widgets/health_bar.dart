import 'package:flutter/material.dart';

class HealthBar extends StatelessWidget {
  final double currentHP;

  Color getHealthBarColor(double value) {
    if (value > 0.66) {
      return Color.lerp(Colors.yellow, Colors.green, (value - 0.66) / 0.34)!;
    } else if (value > 0.33) {
      return Color.lerp(Colors.red, Colors.yellow, (value - 0.33) / 0.33)!;
    } else {
      return Colors.red;
    }
  }

  const HealthBar({super.key, required this.currentHP});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: SizedBox(
        height: 10,
        width: 200,
        child: Stack(
          children: [
            // Bottom layer
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOutCubic,
              tween: Tween<double>(begin: 0, end: currentHP),
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value,
                  minHeight: 10,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                );
              },
            ),
            // Top layer
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCirc, // easeInOutBack
              tween: Tween<double>(begin: 0, end: currentHP),
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value,
                  minHeight: 10,
                  backgroundColor: Colors.transparent,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(getHealthBarColor(value)),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
