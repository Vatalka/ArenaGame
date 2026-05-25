import 'package:arena_game/features/battle/domain/entities/log/battle_log_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'battle_log_controller.g.dart';

@riverpod
class BattleLogController extends _$BattleLogController {
  @override
  List<BattleLogItem> build() {
    return [];
  }

  void addLog(String message, LogType type) {
    final newItem = BattleLogItem(
      id: const Uuid().v4(),
      timestamp: DateTime.now(),
      message: message,
      type: type,
    );
    state = [...state, newItem];
  }

  void clearLog() {
    state = [];
  }
}
