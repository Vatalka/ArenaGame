import 'package:arena_game/features/battle/domain/entities/battle_selection.dart';
import 'package:arena_game/features/log/domain/entities/battle_log_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'battle_log_notifier.g.dart';

@riverpod
class BattleLogNotifier extends _$BattleLogNotifier {
  @override
  List<BattleLogItem> build() => [];

  void addInfoLog(String message) {
    _addLog(
      BattleLogItem.info(
        id: const Uuid().v4(),
        timestamp: DateTime.now(),
        message: message,
      ),
    );
  }

  void addAttackLog(String attackerName, Area area, int damage) {
    _addLog(
      BattleLogItem.attack(
        id: const Uuid().v4(),
        timestamp: DateTime.now(),
        attackerName: attackerName,
        area: area,
        damage: damage,
      ),
    );
  }

  void addBlockLog(String defenderName, Area area) {
    _addLog(
      BattleLogItem.block(
        id: const Uuid().v4(),
        timestamp: DateTime.now(),
        defenderName: defenderName,
        area: area,
      ),
    );
  }

  void addStartBattleLog(String playerName, String botName) {
    _addLog(BattleLogItem.startBattle(
      id: const Uuid().v4(),
      timestamp: DateTime.now(),
      playerName: playerName,
      botName: botName,
    ));
  }

  void addEndBattleLog(BattleResult result, String winnerName) {
    _addLog(
      BattleLogItem.endBattle(
        id: const Uuid().v4(),
        timestamp: DateTime.now(),
        result: result,
        winnerName: winnerName,
      ),
    );
  }

  void _addLog(BattleLogItem item) {
    state = [...state, item];
  }

  void clearLog() {
    state = [];
  }
}
