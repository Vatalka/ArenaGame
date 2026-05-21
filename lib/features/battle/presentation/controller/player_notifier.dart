import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_notifier.g.dart';

@Riverpod(keepAlive: true)
class PlayerNotifier extends _$PlayerNotifier {
  @override
  Character build() => Character.createDefault();

  void selectCharacter(Character character) => state = character;

  void dealDamage(int amount) {
    state = state.copyWith(
      currentHp: (state.currentHp - amount).clamp(0, state.maxHp),
    );
  }

  void restoreHp() {
    state = state.copyWith(currentHp: state.maxHp);
  }
}
