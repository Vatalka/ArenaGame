import 'package:arena_game/features/battle/domain/entities/log/battle_log_item.dart';
import 'package:arena_game/features/battle/presentation/controllers/log/battle_log_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BattleLogView extends ConsumerWidget {
  const BattleLogView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = ref.watch(battleLogControllerProvider);
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
            style: TextStyle(color: _getLogColor(log.type), fontSize: 14),
          ),
        );
      },
    );
  }

  Color _getLogColor(LogType type) {
    switch (type) {
      case LogType.attack:
        return Colors.orange;
      case LogType.damage:
        return Colors.redAccent;
      case LogType.block:
        return Colors.green;
      case LogType.info:
        return Colors.grey;
    }
  }

  String _formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";
  }
}
