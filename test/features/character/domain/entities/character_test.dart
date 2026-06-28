import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('nameIsValid / nameError', () {
    test('ім\'я коротше 3 символів — невалідне', () {
      final character = Character.createNew().copyWith(name: 'Бo');
      expect(character.nameIsValid, false);
    });

    test('ім\'я з 3+ символів — валідне', () {
      final character = Character.createNew().copyWith(name: 'Бот');
      expect(character.nameIsValid, true);
    });

    test('порожнє ім\'я не показує помилку (ще не почали вводити)', () {
      final character = Character.createNew();
      expect(character.nameError, isNull);
    });

    test('коротке непорожнє ім\'я показує помилку', () {
      final character = Character.createNew().copyWith(name: 'Бо');
      expect(character.nameError, isNotNull);
    });
  });

  group('maxHp', () {
    test('дорівнює vitality * 10', () {
      final character = Character.createNew().copyWith(vitality: 17);
      expect(character.maxHp, 170);
    });
  });

  group('nextLevelExp', () {
    test('рівень 1 потребує 10 досвіду', () {
      final character = Character.createNew();
      expect(character.nextLevelExp, 10);
    });

    test('рівень 3 потребує 80 досвіду (10 << 3)', () {
      final character = Character.createNew().copyWith(level: 3);
      expect(character.nextLevelExp, 80);
    });

    test('рівень 10+ повертає 0 (досвід більше не нараховується)', () {
      final character = Character.createNew().copyWith(level: 10);
      expect(character.nextLevelExp, 0);
    });
  });

  group('earnExperience', () {
    test('недостатньо досвіду — рівень не змінюється', () {
      final character = Character.createNew();
      final result = character.earnExperience(5);

      expect(result.level, 0);
      expect(result.experience, 5);
    });

    test(
      'достатньо досвіду — рівень підвищується, HP відновлюється до максимуму',
      () {
        final character = Character.createNew().copyWith(currentHp: 30);
        final result = character.earnExperience(10);

        expect(result.level, 1);
        expect(result.statPoints, 3);
        expect(result.vitality, 11);
        expect(result.strength, 14);
        expect(result.currentHp, result.maxHp);
      },
    );

    test('множинний level-up, HP відновлюється до максимуму', () {
      final character = Character.createNew();
      final result = character.earnExperience(25);

      expect(result.level, 1);
      expect(result.experience, 15);
    });
  });

  group('actualHp — регенерація', () {
    test('в бою регенерація не відбувається з часом', () {
      final character = Character.createNew().copyWith(
        currentHp: 50,
        vitality: 10,
        isInCombat: true,
        lastUpdateTime: DateTime.now()
            .subtract(const Duration(hours: 1))
            .millisecondsSinceEpoch,
      );

      expect(character.actualHp, 50);
    });

    test('повне HP лишається повним, незалежно від часу', () {
      final character = Character.createNew().copyWith(
        vitality: 10,
        isInCombat: false,
        lastUpdateTime: DateTime.now()
            .subtract(const Duration(minutes: 10))
            .millisecondsSinceEpoch,
      );

      expect(character.actualHp, 100);
    });

    test('поза боєм HP зростає з часом і не перевищує maxHp', () {
      final character = Character.createNew().copyWith(
        currentHp: 50,
        vitality: 10,
        isInCombat: false,
        lastUpdateTime: DateTime.now()
            .subtract(const Duration(seconds: 900))
            .millisecondsSinceEpoch,
      );

      // Параметри регенерації: 1% maxHp every 2s, або 100% every 200s
      expect(character.actualHp, 100);
    });
  });
}
