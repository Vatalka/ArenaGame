import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerProvider = NotifierProvider<PlayerNotifier, Character>(() {
  return PlayerNotifier();
});

class PlayerNotifier extends Notifier<Character> {
  @override
  Character build() {
    return ref.read(characterRepositoryProvider).getHero('Player');
  }

  void takeDamage(int damage) {
    state = state.copyWith(
      currentHp: (state.currentHp - damage).clamp(0, state.maxHp),
    );
  }

  void restoreHp() {
    state = state.copyWith(currentHp: state.maxHp);
  }
}
