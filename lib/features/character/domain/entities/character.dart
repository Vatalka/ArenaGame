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
    required int level,
    required int experience,
    required int statPoints,
  }) = _Character;

  factory Character.createNew() {
    return Character(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: '',
      currentHp: 100,
      vitality: 10,
      strength: 10,
      lastUpdateTime: 0,
      level: 0,
      experience: 0,
      statPoints: 0,
    );
  }

  factory Character.createEmpty() {
    return Character(
      id: '',
      name: '',
      currentHp: 0,
      vitality: 0,
      strength: 0,
      lastUpdateTime: 0,
      level: 0,
      experience: 0,
      statPoints: 0,
    );
  }

  Character earnExperience(int gainedExp) {
    int totalExp = experience + gainedExp;
    int currentLevel = level;
    int currentPoints = statPoints;

    while (totalExp >= (currentLevel * 100)) {
      totalExp -= (currentLevel * 100);
      currentLevel++;
      currentPoints += 3;
    }

    return copyWith(
      experience: totalExp,
      level: currentLevel,
      statPoints: currentPoints,
    );
  }

  int get maxHp => vitality * 10;

  int get regenPerTick => (maxHp * 0.01).ceil();

  int get actualHp {
    if (currentHp >= maxHp) return currentHp;

    final int now = DateTime.now().millisecondsSinceEpoch;
    final int differenceInMs = now - lastUpdateTime;
    final int secondsPassed = differenceInMs ~/ 1000;
    final int ticks = secondsPassed ~/ 2;

    if (ticks <= 0) return currentHp;

    final regenAmount = ticks * regenPerTick;
    final newHp = (currentHp + regenAmount).clamp(0, maxHp);
    return newHp;
  }

  bool get nameIsValid => name.trim().length >= 3;

  String? get nameError {
    if (name.isEmpty) return null;
    if (name.trim().length < 3) return 'Name is too short';
    return null;
  }
}
