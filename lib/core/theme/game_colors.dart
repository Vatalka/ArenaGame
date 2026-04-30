import 'package:flutter/material.dart';

class GameColors extends ThemeExtension<GameColors> {
  final Color health;

  GameColors({
    required this.health,
  });

  @override
  ThemeExtension<GameColors> copyWith({Color? health}) {
    return GameColors(health: health ?? this.health);
  }

  @override
  ThemeExtension<GameColors> lerp(
      covariant ThemeExtension<GameColors>? other, double t) {
    if (other is! GameColors) return this;
    return GameColors(
      health: Color.lerp(health, other.health, t)!,
    );
  }
}
