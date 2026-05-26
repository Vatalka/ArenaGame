import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/features/battle/domain/entities/log/battle_log_item.dart';
import 'package:arena_game/features/battle/presentation/controllers/log/battle_log_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BattleLogView extends ConsumerWidget {
  const BattleLogView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = ref.watch(battleLogProvider);
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
          child: Text(
            '[${_formatTime(log.timestamp)}] ${log.message}',
            style: TextStyle(
              color: _getLogColor(context, log.type),
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }

  Color _getLogColor(BuildContext context, LogType type) {
    final gameColors = Theme.of(context).extension<GameColors>()!;
    switch (type) {
      case LogType.attack:
        return gameColors.logAttack;
      case LogType.damage:
        return gameColors.logDamage;
      case LogType.block:
        return gameColors.logBlock;
      case LogType.info:
        return gameColors.logInfo;
    }
  }

  String _formatTime(DateTime time) => DateFormat('HH:mm:ss').format(time);
}
