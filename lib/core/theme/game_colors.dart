import 'package:flutter/material.dart';

class GameColors extends ThemeExtension<GameColors> {
  final Color healthHigh;
  final Color healthMedium;
  final Color healthLow;
  final Color logAttack;
  final Color logDamage;
  final Color logBlock;
  final Color logInfo;

  GameColors({
    required this.healthHigh,
    required this.healthMedium,
    required this.healthLow,
    required this.logAttack,
    required this.logDamage,
    required this.logBlock,
    required this.logInfo,
  });

  @override
  GameColors copyWith({
    Color? healthHigh,
    Color? healthMedium,
    Color? healthLow,
    Color? logAttack,
    Color? logDamage,
    Color? logBlock,
    Color? logInfo,
  }) {
    return GameColors(
      healthHigh: healthHigh ?? this.healthHigh,
      healthMedium: healthMedium ?? this.healthMedium,
      healthLow: healthLow ?? this.healthLow,
      logAttack: logAttack ?? this.logAttack,
      logDamage: logDamage ?? this.logDamage,
      logBlock: logBlock ?? this.logBlock,
      logInfo: logInfo ?? this.logInfo,
    );
  }

  @override
  GameColors lerp(ThemeExtension<GameColors>? other, double t) {
    if (other is! GameColors) return this;
    return GameColors(
      healthHigh: Color.lerp(healthHigh, other.healthHigh, t)!,
      healthMedium: Color.lerp(healthMedium, other.healthMedium, t)!,
      healthLow: Color.lerp(healthLow, other.healthLow, t)!,
      logAttack: Color.lerp(logAttack, other.logAttack, t)!,
      logDamage: Color.lerp(logDamage, other.logDamage, t)!,
      logBlock: Color.lerp(logBlock, other.logBlock, t)!,
      logInfo: Color.lerp(logInfo, other.logInfo, t)!,
    );
  }
}
