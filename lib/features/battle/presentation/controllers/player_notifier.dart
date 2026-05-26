import 'package:arena_game/features/battle/domain/entities/log/battle_log_item.dart';
import 'package:arena_game/features/battle/presentation/controllers/log/battle_log_notifier.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_notifier.g.dart';

@Riverpod(keepAlive: true)
class PlayerNotifier extends _$PlayerNotifier {
  @override
  Character build() => Character.createDefault();

  late final _battleLogController = ref.read(battleLogProvider.notifier);

  void selectCharacter(Character character) => state = character;

  void dealDamage(int amount) {
    state = state.copyWith(
      currentHp: (state.currentHp - amount).clamp(0, state.maxHp),
    );
    _battleLogController.addLog('Гравець дає собі ляпаса!', LogType.attack);
  }

  void restoreHp() {
    state = state.copyWith(currentHp: state.maxHp);
    _battleLogController.addLog(
      'Гравець відновлює здоровля, хитрун :)',
      LogType.block,
    );
  }
}
