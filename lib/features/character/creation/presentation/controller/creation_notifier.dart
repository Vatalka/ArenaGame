import 'package:arena_game/features/character/creation/domain/entities/creation.dart';
import 'package:arena_game/features/character/creation/domain/entities/stat_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'creation_notifier.g.dart';

@riverpod
class CreationNotifier extends _$CreationNotifier {
  @override
  Creation build() => const Creation();

  void updateName(String name) => state = state.copyWith(name: name);

  void incrementStat(StatType type) {
    state = state.copyWith(
      vitality: type == StatType.vitality ? state.vitality + 1 : state.vitality,
      strength: type == StatType.strength ? state.strength + 1 : state.strength,
      remainingPoints: state.remainingPoints - 1,
    );
  }

  bool canDecrement(StatType type) {
    final currentValue = getValueFor(type);
    return currentValue > 3;
  }

  int getValueFor(StatType type) {
    return switch (type) {
      StatType.vitality => state.vitality,
      StatType.strength => state.strength,
    };
  }

  void decrementStat(StatType type) {
    state = state.copyWith(
      vitality: type == StatType.vitality ? state.vitality - 1 : state.vitality,
      strength: type == StatType.strength ? state.strength - 1 : state.strength,
      remainingPoints: state.remainingPoints + 1,
    );
  }
}
