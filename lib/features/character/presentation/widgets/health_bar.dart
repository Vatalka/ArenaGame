import 'package:arena_game/core/theme/game_colors.dart';
import 'package:flutter/material.dart';

class HealthBar extends StatelessWidget {
  final double hp;

  const HealthBar({super.key, required this.hp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              // Bottom layer
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOutCubic,
                tween: Tween<double>(begin: hp, end: hp),
                builder: (context, value, child) {
                  return LinearProgressIndicator(
                    value: value,
                    minHeight: 10,
                    backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.surfaceContainerLowest,
                    ),
                  );
                },
              ),
              // Top layer
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCirc,
                tween: Tween<double>(begin: hp, end: hp),
                builder: (context, value, child) {
                  return LinearProgressIndicator(
                    value: value,
                    minHeight: 10,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _getHealthBarColor(context, value),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getHealthBarColor(BuildContext context, double value) {
    final gameColors = Theme.of(context).extension<GameColors>()!;

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
