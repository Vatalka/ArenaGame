// import 'dart:math';

import 'package:arena_game/features/battle/domain/battle_state.dart';
import 'package:arena_game/features/character/domain/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BattleNotifier extends Notifier<BattleState> {
  // final _random = Random();

  Character player1 = Character(
    name: 'player',
    currentHp: 100,
    maxHp: 100,
    vitality: 1,
    strength: 1,
    precision: 1,
    agility: 1,
  );
  Character enemy1 = Character(
    name: 'enemy',
    currentHp: 100,
    maxHp: 100,
    vitality: 1,
    strength: 1,
    precision: 1,
    agility: 1,
  );

  @override
  BattleState build() {
    return BattleState(
      player: player1,
      enemy: enemy1,
      battleLog: [],
    );
  }

  void playerAttack() {
    state = state.copyWith();
  }
}

final battleProvider = NotifierProvider<BattleNotifier, BattleState>(() {
  return BattleNotifier();
});
