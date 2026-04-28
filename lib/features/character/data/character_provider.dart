import 'package:arena_game/features/character/domain/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterProvider = StateProvider<Character>(
  (ref) {
    return Character(
      name: 'Player',
      currentHp: 100,
      maxHp: 100,
      vitality: 5,
      strength: 5,
      precision: 5,
      agility: 5,
    );
  },
);

/// TO DOO:
// Цей файл треба видалити, а замість нього буде character_service_implementation
// де буде реалізовано логіку