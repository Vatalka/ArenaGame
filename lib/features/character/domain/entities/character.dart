import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

@freezed
abstract class Character with _$Character {
  const Character._();

  const factory Character({
    required String id,
    @Default('') String name,
    @Default(100) int currentHp,
    @Default(10) int vitality,
    @Default(10) int strength,
    @Default(0) int lastUpdateTime,
    @Default(0) int level,
    @Default(0) int experience,
    @Default(0) int statPoints,
  }) = _Character;

  factory Character.createDefault() {
    return Character(id: DateTime.now().millisecondsSinceEpoch.toString());
  }

  factory Character.createEmpty() {
    return Character(id: '');
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
}
