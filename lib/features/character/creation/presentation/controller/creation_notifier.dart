import 'package:arena_game/features/character/creation/domain/entities/creation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'creation_notifier.g.dart';

@riverpod
class CreationNotifier extends _$CreationNotifier {
  @override
  CreationState build() => const CreationState();

  void updateName(String name) => state = state.copyWith(name: name);

  void incrementStat(String statName) {
    if (state.remainingPoints > 0) {
      if (statName == 'vitality') {
        state = state.copyWith(
          vitality: state.vitality + 1,
          remainingPoints: state.remainingPoints - 1,
        );
      }
      if (statName == 'strength') {
        state = state.copyWith(
          strength: state.strength + 1,
          remainingPoints: state.remainingPoints - 1,
        );
      }
    }
  }

  void decrementStat(String statName) {
    if (statName == 'vitality' && state.vitality > 3) {
      state = state.copyWith(
        vitality: state.vitality - 1,
        remainingPoints: state.remainingPoints + 1,
      );
    }
    if (statName == 'strength' && state.strength > 3) {
      state = state.copyWith(
        strength: state.strength - 1,
        remainingPoints: state.remainingPoints + 1,
      );
    }
  }
}
