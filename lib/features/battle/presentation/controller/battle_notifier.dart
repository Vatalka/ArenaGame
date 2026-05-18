import 'package:arena_game/features/battle/domain/entities/battle_selection.dart';
import 'package:arena_game/features/battle/presentation/controller/player_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  void selectBlock(Area? area) {
    state = state.copyWith(selectedBlock: area);
  }

  void confirmTurn() {
    final currentPlayer = ref.read(playerProvider);
    ref.read(playerProvider.notifier).dealDamage(currentPlayer.strength);
  }
}
