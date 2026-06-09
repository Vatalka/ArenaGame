import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/features/battle/presentation/controllers/battle_notifier.dart';
import 'package:arena_game/features/battle/presentation/controllers/turn_timer_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TurnTimerIndicator extends ConsumerWidget {
  const TurnTimerIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(battleProvider);
    final turnTimer = ref.watch(turnTimerProvider);
    final double progress = turnTimer / 10.0;
    final gameColors = Theme.of(context).extension<GameColors>()!;
    final Color timerColor = turnTimer <= 5
        ? gameColors.healthLow
        : gameColors.healthMedium;

    return Opacity(
      opacity: state.isBotMode ? 1.0 : 0.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.scrim.withValues(alpha: 0.2),
              ),
            ),
          ),

          SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(timerColor),
            ),
          ),

          Text(
            '$turnTimer',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: state.isTurnReady
                  ? Theme.of(context).colorScheme.onPrimaryContainer
                  : Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
