import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/core/widgets/game_progress_bar.dart';
import 'package:flutter/material.dart';

class ExperienceBar extends StatelessWidget {
  final double xp;

  const ExperienceBar({super.key, required this.xp});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gameColors = theme.extension<GameColors>()!;
    final xpColor = gameColors.logAttack;

    return GameProgressBar(
      value: xp,
      fillColorBuilder: (_) => xpColor,
      backgroundColor: theme.colorScheme.surfaceDim,
      trailingColor: xpColor.withValues(alpha: 0.2),
      height: 5,
      trailingDuration: const Duration(milliseconds: 2000),
    );
  }
}
