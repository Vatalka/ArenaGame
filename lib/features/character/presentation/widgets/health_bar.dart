import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/core/widgets/game_progress_bar.dart';
import 'package:flutter/material.dart';

class HealthBar extends StatelessWidget {
  final double hp;

  const HealthBar({super.key, required this.hp});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gameColors = theme.extension<GameColors>()!;

    return GameProgressBar(
      value: hp,
      fillColorBuilder: (animValue) =>
          _getHealthBarColor(gameColors, animValue),
      backgroundColor: theme.colorScheme.surfaceDim,
      trailingColor: theme.colorScheme.surfaceContainerLowest,
    );
  }

  Color _getHealthBarColor(GameColors gameColors, double value) {
    if (value > 0.66) {
      return Color.lerp(
        gameColors.healthMedium,
        gameColors.healthHigh,
        (value - 0.66) / 0.33,
      )!;
    } else if (value > 0.33) {
      return Color.lerp(
        gameColors.healthLow,
        gameColors.healthMedium,
        (value - 0.33) / 0.33,
      )!;
    } else {
      return gameColors.healthLow;
    }
  }
}
