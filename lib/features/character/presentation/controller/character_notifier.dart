import 'package:arena_game/features/character/data/repositories/character_repository_impl.dart';
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

  void takeDamage(double damage) {
    state = state.copyWith(
        currentHp: (state.currentHp - damage).round().clamp(0, state.maxHp));
  }

  void restoreHp() {
    state = state.copyWith(currentHp: state.maxHp);
  }
}
