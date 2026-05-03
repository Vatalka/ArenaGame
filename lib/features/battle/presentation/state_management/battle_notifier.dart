import 'package:arena_game/features/battle/domain/battle_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BattleNotifier extends StateNotifier<BattleState> {
  BattleNotifier() : super(const BattleState());

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
    StateNotifierProvider<BattleNotifier, BattleState>((ref) {
  return BattleNotifier();
});
