import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

@freezed
abstract class Character with _$Character {
  const Character._();

  const factory Character({
    required String id,
    required String name,
    required int currentHp,
    required int vitality,
    required int strength,
    required int lastUpdateTime,
  }) = _Character;

  int get maxHp => vitality * 10;

  int get damage => strength;

  factory Character.createDefault() {
    const defaultValue = 10;
    return Character(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: '',
      currentHp: defaultValue * 10,
      vitality: defaultValue,
      strength: defaultValue,
      lastUpdateTime: 0,
    );
  }

  factory Character.createEmpty() {
    const defaultValue = 0;
    return Character(
      id: '',
      name: '',
      currentHp: defaultValue,
      vitality: defaultValue,
      strength: defaultValue,
      lastUpdateTime: defaultValue,
    );
  }

  int get actualHp {
    if (lastUpdateTime == 0 || currentHp >= maxHp) {
      return currentHp;
    }

    final int now = DateTime.now().millisecondsSinceEpoch;
    final int differenceInMs = now - lastUpdateTime;
    final int secondsPassed = differenceInMs ~/ 1000;
    final int totalTicks = secondsPassed ~/ 2;

    if (totalTicks > 0) {
      final int hpPerTick = (maxHp * 0.01).ceil();
      final int totalHpRegenerated = totalTicks * hpPerTick;

      return (currentHp + totalHpRegenerated).clamp(0, maxHp);
    }

    return currentHp;
  }

  bool get nameIsValid => name.trim().length >= 3;

  String? get nameError {
    if (name.isEmpty) return null;
    if (name.trim().length < 3) return 'Name is too short';
    return null;
  }
}
