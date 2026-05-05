import 'package:arena_game/features/battle/domain/entities/battle_selection.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:arena_game/features/battle/domain/usecases/deal_damage_usecase.dart';

part 'battle_notifier.g.dart';

@riverpod
class BattleNotifier extends _$BattleNotifier {
  @override
  BattleSelection build() {
    return const BattleSelection();
  }

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
      ref.read(dealDealDamageUseCaseProvider).execute();
    }
  }
}
