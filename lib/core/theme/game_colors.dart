import 'package:flutter/material.dart';

class GameColors extends ThemeExtension<GameColors> {
  final Color healthHigh;
  final Color healthMedium;
  final Color healthLow;

  GameColors({
    required this.healthHigh,
    required this.healthMedium,
    required this.healthLow,
  });

  @override
  GameColors copyWith(
      {Color? healthHigh, Color? healthMedium, Color? healthLow}) {
    return GameColors(
      healthHigh: healthHigh ?? this.healthHigh,
      healthMedium: healthMedium ?? this.healthMedium,
      healthLow: healthLow ?? this.healthLow,
    );
  }

  @override
  GameColors lerp(ThemeExtension<GameColors>? other, double t) {
    if (other is! GameColors) return this;
    return GameColors(
      healthHigh: Color.lerp(healthHigh, other.healthHigh, t)!,
      healthMedium: Color.lerp(healthMedium, other.healthMedium, t)!,
      healthLow: Color.lerp(healthLow, other.healthLow, t)!,
    );
  }
}
