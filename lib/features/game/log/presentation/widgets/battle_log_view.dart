import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/features/game/battle/domain/entities/battle_selection.dart';
import 'package:arena_game/features/game/log/domain/entities/battle_log_item.dart';
import 'package:arena_game/features/game/log/presentation/controllers/battle_log_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BattleLogView extends ConsumerWidget {
  const BattleLogView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = ref.watch(battleLogProvider);
    final gameColors = Theme.of(context).extension<GameColors>()!;

    return ListView.builder(
      reverse: true,
      itemCount: logs.length,
      itemBuilder: (context, index) {
        final log = logs[logs.length - 1 - index];

        return Padding(
          padding: const EdgeInsetsGeometry.symmetric(
            vertical: 2,
            horizontal: 8,
          ),
          child: Text.rich(
            TextSpan(
              style: const TextStyle(fontSize: 14),
              children: [
                TextSpan(
                  text: '[${_formatTime(log.timestamp)}] ',
                  style: TextStyle(color: gameColors.logInfo),
                ),
                ...log.when(
                  info: (id, time, message) => [
                    TextSpan(
                      text: message,
                      style: TextStyle(color: gameColors.logInfo),
                    ),
                  ],
                  attack: (id, time, attackerName, area, damage) => [
                    TextSpan(
                      text: attackerName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' завдав удар у ${area.toLogString} на '),
                    TextSpan(
                      text: '$damage',
                      style: TextStyle(
                        color: gameColors.logDamage,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: ' шкоди!'),
                  ],
                  block: (id, time, defenderName, area) => [
                    TextSpan(
                      text: defenderName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' успішно заблокував удар у ${area.toLogString}!',
                    ),
                  ],
                  gameOver: (id, time, result, winnerName) {
                    return [
                      TextSpan(
                        text: switch (result) {
                          BattleResult.draw =>
                            'Бій завершено нічиєю! Обидва бійці непритомні!',
                          BattleResult.playerWin ||
                          BattleResult.botWin => 'Бій завершено! Переміг ',
                        },
                        style: TextStyle(color: gameColors.logInfo),
                      ),
                      if (result != BattleResult.draw) ...[
                        TextSpan(
                          text: winnerName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '!',
                          style: TextStyle(color: gameColors.logInfo),
                        ),
                      ],
                    ];
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatTime(DateTime time) => DateFormat('HH:mm:ss').format(time);
}
