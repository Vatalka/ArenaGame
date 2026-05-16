import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_notifier.g.dart';

@riverpod
class PlayerNotifier extends _$PlayerNotifier {
  @override
  Character build() {
    final initialData = ref.watch(activeCharacterProvider);
    return initialData ?? Character.createDefault();
  }

  void dealDamage(int amount) {
    state = state.copyWith(
      currentHp: (state.currentHp - amount).clamp(0, state.maxHp),
    );
  }

  void restoreHp() {
    state = state.copyWith(currentHp: state.maxHp);
  }

  Future<void> syncWithDatabase() async {
    final repository = ref.read(characterRepositoryProvider);
    await repository.saveCharacter(state);
  }
}
