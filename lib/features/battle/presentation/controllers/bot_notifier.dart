import 'dart:math';

import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/battle/domain/entities/battle_selection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bot_notifier.g.dart';

@riverpod
class BotNotifier extends _$BotNotifier {
  @override
  Character build() =>
      Character.createNew().copyWith(name: 'Бот Залізяка', isInCombat: true);

  void takeDamage(int damage) {
    state = state.copyWith(
      currentHp: (state.currentHp - damage).clamp(0, state.maxHp),
    );
  }

  Area getTestArea() => Area.head;

  Area getRandomArea() {
    final random = Random();
    final areas = Area.values;
    final randomIndex = random.nextInt(areas.length);
    return areas[randomIndex];
  }
}
