import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/character_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterProvider =
    NotifierProviderFamily<PlayerNotifier, Character, String>(() {
  return PlayerNotifier();
});

class PlayerNotifier extends FamilyNotifier<Character, String> {
  @override
  Character build(String arg) {
    return Modular.get<CharacterRepository>().getHero(arg);
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
