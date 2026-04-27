import 'package:arena_game/features/character/domain/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterProvider = StateProvider<Character>(
  (ref) {
    return Character(
      name: 'Hero',
      hp: 100,
      maxHp: 100,
      vitality: 5,
      strength: 5,
      precision: 5,
      agility: 5,
    );
  },
);
