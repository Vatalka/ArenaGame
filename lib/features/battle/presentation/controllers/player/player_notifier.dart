import 'package:arena_game/features/battle/presentation/controllers/log/battle_log_notifier.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_notifier.g.dart';

@Riverpod(keepAlive: true)
class PlayerNotifier extends _$PlayerNotifier {
  @override
  Character build() => Character.createDefault();

  void selectCharacter(Character character) => state = character;

  void takeDamage(int amount) {
    state = state.copyWith(
      currentHp: (state.currentHp - amount).clamp(0, state.maxHp),
    );
  }

  void restoreHp() {
    state = state.copyWith(currentHp: state.maxHp);
    ref
        .read(battleLogProvider.notifier)
        .addInfoLog('Гравець відновлює здоровля, хитрун :)');
  }
}
