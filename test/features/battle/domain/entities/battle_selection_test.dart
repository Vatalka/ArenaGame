import 'package:arena_game/features/battle/domain/entities/battle_selection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isTurnReady', () {
    test('Зони атаки та блоку обрані', () {
      final battleSelection = BattleSelection().copyWith(
        selectedAttack: Area.head,
        selectedBlock: Area.body,
      );
      expect(battleSelection.isTurnReady, true);
    });

    test('Зони атаки та блоку не обрані', () {
      final battleSelection = BattleSelection().copyWith(
        selectedAttack: null,
        selectedBlock: null,
      );
      expect(battleSelection.isTurnReady, false);
    });

    test('Зона атаки обрана, зона блоку не обрана', () {
      final battleSelection = BattleSelection().copyWith(
        selectedAttack: Area.body,
        selectedBlock: null,
      );
      expect(battleSelection.isTurnReady, false);
    });

    test('Зона атаки не обрана, зона блоку обрана', () {
      final battleSelection = BattleSelection().copyWith(
        selectedAttack: null,
        selectedBlock: Area.legs,
      );
      expect(battleSelection.isTurnReady, false);
    });
  });
}
