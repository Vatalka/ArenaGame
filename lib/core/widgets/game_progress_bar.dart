import 'package:flutter/material.dart';

class GameProgressBar extends StatelessWidget {
  final double value;
  final Color Function(double animatedValue) fillColorBuilder;
  final Color backgroundColor;
  final Color trailingColor;
  final double height;
  final Duration fillDuration;
  final Duration trailingDuration;
  final Curve fillCurve;
  final Curve trailingCurve;

  const GameProgressBar({
    super.key,
    required this.value,
    required this.fillColorBuilder,
    required this.backgroundColor,
    required this.trailingColor,
    required this.height,
    this.fillDuration = const Duration(milliseconds: 500),
    this.trailingDuration = const Duration(milliseconds: 1000),
    this.fillCurve = Curves.easeOutCirc,
    this.trailingCurve = Curves.easeInOutCubic,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            // Bottom layer
            TweenAnimationBuilder<double>(
              duration: trailingDuration,
              curve: trailingCurve,
              tween: Tween<double>(begin: value, end: value),
              builder: (context, animValue, child) {
                return LinearProgressIndicator(
                  value: animValue,
                  minHeight: height,
                  backgroundColor: backgroundColor,
                  valueColor: AlwaysStoppedAnimation<Color>(trailingColor),
                );
              },
            ),

            // Top layer
            TweenAnimationBuilder<double>(
              duration: fillDuration,
              curve: fillCurve,
              tween: Tween<double>(begin: value, end: value),
              builder: (context, animValue, child) {
                return LinearProgressIndicator(
                  value: animValue,
                  minHeight: height,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    fillColorBuilder(animValue),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
