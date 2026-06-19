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
    required bool isInCombat,
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
      isInCombat: false,
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
      isInCombat: false,
    );
  }

  Character earnExperience(int gainedExp) {
    int totalExp = experience + gainedExp;
    int currentLevel = level;
    int currentPoints = statPoints;
    int currentVitality = vitality;
    int currentStrength = strength;
    bool isLevelUp = false;

    while (totalExp >= nextLevelExp) {
      totalExp -= nextLevelExp;
      currentLevel++;
      currentPoints += 3;
      currentVitality += 1;
      currentStrength += 4;
      isLevelUp = true;
    }

    return copyWith(
      experience: totalExp,
      level: currentLevel,
      statPoints: currentPoints,
      vitality: currentVitality,
      strength: currentStrength,
      currentHp: isLevelUp ? maxHp : currentHp,
    );
  }

  int get nextLevelExp {
    if (level >= 10) return 0; // треба зупинити нарахування досвіду
    return 10 << level; // == 10 * 2^level == 10 * pow(2, level).toInt()
  }

  int get maxHp => vitality * 10;

  double get actualHp {
    if (currentHp >= maxHp || isInCombat == true) {
      return currentHp.toDouble();
    }

    final int now = DateTime.now().millisecondsSinceEpoch;
    final int differenceMs = now - lastUpdateTime;

    if (differenceMs <= 0) return currentHp.toDouble();

    final double hpPerMs = (maxHp * 0.01) / 2000;
    final double gainedHp = differenceMs * hpPerMs;

    return (currentHp + gainedHp).clamp(0.0, maxHp.toDouble());
  }

  int get regenPerTick => (maxHp * 0.01).ceil();

  bool get nameIsValid => name.trim().length >= 3;

  String? get nameError {
    if (name.isEmpty) return null;
    if (name.trim().length < 3) return 'Name is too short';
    return null;
  }
}
