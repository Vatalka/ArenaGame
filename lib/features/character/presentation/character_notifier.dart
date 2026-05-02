import 'package:arena_game/features/character/data/providers/character_provider.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_notifier.g.dart';

@Riverpod(keepAlive: true)
class CharacterNotifier extends _$CharacterNotifier {
  @override
  Character build(String characterName) {
    final repository = ref.watch(characterRepositoryProvider);
    return repository.getHero(characterName);
  }

  void takeDamage(int damage) {
    state = state.copyWith(
        currentHp: (state.currentHp - damage).clamp(0, state.maxHp));
  }

  void restoreHp() {
    state = state.copyWith(currentHp: state.maxHp);
  }
}
