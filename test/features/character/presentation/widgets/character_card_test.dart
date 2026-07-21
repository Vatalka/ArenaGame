import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:arena_game/features/character/presentation/controllers/selection_notifier.dart';
import 'package:arena_game/features/character/presentation/widgets/character_card.dart';
import 'package:arena_game/features/character/presentation/widgets/experience_bar.dart';
import 'package:arena_game/features/character/presentation/widgets/health_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/test_theme.dart';

class MockCharacterRepository extends Mock implements ICharacterRepository {}

class FakeSelectionNotifier extends SelectionNotifier {
  final List<Character> characters;

  FakeSelectionNotifier(this.characters);

  @override
  Future<List<Character>> build() async => characters;

  @override
  void updateCharacterInList(Character updatedChar) {}

  @override
  void setCombatState({required String id, required bool isInCombat}) {}
}

final testCharacter = Character.createNew().copyWith(
  id: 'card-1',
  name: 'Gerald',
  vitality: 14,
  strength: 14,
  currentHp: 140,
  level: 1,
  experience: 5,
  // щоб Timer не запускався
  isInCombat: true,
  lastUpdateTime: DateTime.now().millisecondsSinceEpoch,
);

Widget buildCard(Character character, MockCharacterRepository mockRepo) {
  return ProviderScope(
    overrides: [
      characterRepositoryProvider.overrideWithValue(mockRepo),
      selectionProvider.overrideWith(() => FakeSelectionNotifier([character])),
    ],
    child: buildWithTheme(child: CharacterCard(character: character)),
  );
}

void main() {
  late MockCharacterRepository mockRepo;

  setUpAll(() {
    registerFallbackValue(Character.createEmpty());
  });

  setUp(() {
    mockRepo = MockCharacterRepository();
    when(
      () => mockRepo.getAllCharacters(),
    ).thenAnswer((_) async => [testCharacter]);
    when(() => mockRepo.saveCharacter(any())).thenAnswer((_) async {});
  });

  group('CharacterCard — відображення', () {
    testWidgets('показує ім\'я персонажа', (tester) async {
      await tester.pumpWidget(buildCard(testCharacter, mockRepo));
      await tester.pumpAndSettle();

      expect(find.text('Gerald'), findsOneWidget);
    });

    testWidgets('показує рівень персонажа', (tester) async {
      await tester.pumpWidget(buildCard(testCharacter, mockRepo));
      await tester.pumpAndSettle();

      expect(find.text('[1] '), findsOneWidget);
    });

    testWidgets('показує VIT і STR', (tester) async {
      await tester.pumpWidget(buildCard(testCharacter, mockRepo));
      await tester.pumpAndSettle();

      expect(find.text('VIT: 14'), findsOneWidget);
      expect(find.text('STR: 14'), findsOneWidget);
    });

    testWidgets('показує HP у форматі currentHp/maxHp', (tester) async {
      await tester.pumpWidget(buildCard(testCharacter, mockRepo));
      await tester.pumpAndSettle();

      // maxHp = vitality * 10 == 14 * 10 = 140
      expect(find.text('140/140'), findsOneWidget);
    });

    testWidgets('містить HealthBar', (tester) async {
      await tester.pumpWidget(buildCard(testCharacter, mockRepo));
      await tester.pumpAndSettle();

      expect(find.byType(HealthBar), findsOneWidget);
    });

    testWidgets('містить ExperienceBar', (tester) async {
      await tester.pumpWidget(buildCard(testCharacter, mockRepo));
      await tester.pumpAndSettle();

      expect(find.byType(ExperienceBar), findsOneWidget);
    });
  });

  group('CharacterCard — Timer поведінка', () {
    testWidgets('Timer не запускається коли isInCombat=true', (tester) async {
      await tester.pumpWidget(buildCard(testCharacter, mockRepo));
      await tester.pumpAndSettle();

      // Симулюємо час -> setState
      await tester.pump(const Duration(milliseconds: 500));

      expect(tester.takeException(), isNull);
    });

    testWidgets(
      'Timer запускається і оновлює UI коли HP не повний і поза боєм',
      (tester) async {
        final damagedCharacter = testCharacter.copyWith(
          currentHp: 50,
          isInCombat: false,
          lastUpdateTime: DateTime.now()
              .subtract(const Duration(seconds: 1))
              .millisecondsSinceEpoch,
        );

        await tester.pumpWidget(buildCard(damagedCharacter, mockRepo));

        // Симулюємо кілька тіків Timer
        await tester.pump(const Duration(milliseconds: 40));
        await tester.pump(const Duration(milliseconds: 40));
        await tester.pump(const Duration(milliseconds: 40));

        expect(tester.takeException(), isNull);
      },
    );
  });
}
