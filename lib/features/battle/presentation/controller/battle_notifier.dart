import 'package:arena_game/features/battle/domain/entities/battle_selection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BattleNotifier extends StateNotifier<BattleSelection> {
  BattleNotifier() : super(const BattleSelection());

  void selectAttack(Area? area) {
    state = state.copyWith(selectedAttack: area);
  }

  void selectedBlock(Area? area) {
    state = state.copyWith(selectedBlock: area);
  }

  void confirmTurn() {
    if (state.selectedAttack != null && state.selectedBlock != null) {
      if (kDebugMode) {
        print(
            "Атака в ${state.selectedAttack!.name}, Захист ${state.selectedBlock!.name}");
      }
      // Тут буде виклик Firebase або UseCase
    }
  }
}

final battleControllerProvider =
    StateNotifierProvider<BattleNotifier, BattleSelection>((ref) {
  return BattleNotifier();
});
