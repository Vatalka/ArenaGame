import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:arena_game/features/character/presentation/controllers/selection_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterRepository extends Mock implements ICharacterRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(Character.createEmpty());
  });
  late MockCharacterRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockCharacterRepository();
    container = ProviderContainer(
      overrides: [
        characterRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('build() завантажує персонажів з репозиторію', () async {
    final fakeCharacters = [
      Character.createNew().copyWith(id: '5', name: 'FakeAragon'),
    ];
    when(
      () => mockRepository.getAllCharacters(),
    ).thenAnswer((_) async => fakeCharacters);

    final result = await container.read(selectionProvider.future);

    expect(result, fakeCharacters);
    verify(() => mockRepository.getAllCharacters()).called(1);
  });

  group('upgradeCharacterState', () {
    late Character existingCharacter;

    setUp(() async {
      existingCharacter = Character.createNew().copyWith(
        id: '5',
        name: 'FakeAragon',
        vitality: 17,
        currentHp: 136,
        isInCombat: false,
        lastUpdateTime: 0,
      );

      when(
        () => mockRepository.getAllCharacters(),
      ).thenAnswer((_) async => [existingCharacter]);
      when(() => mockRepository.saveCharacter(any())).thenAnswer((_) async {});

      await container.read(selectionProvider.future);
    });

    test('id не знайдено в списку — стан не змінюється', () {
      final notifier = container.read(selectionProvider.notifier);

      notifier.upgradeCharacterState(id: 'unknown-id', isInCombat: true);

      final state = container.read(selectionProvider).value!;
      expect(state.first.isInCombat, false);
      verifyNever(() => mockRepository.saveCharacter(any()));
    });

    test('isInCombat: true - фіксує поточний currentHp', () {
      final notifier = container.read(selectionProvider.notifier);

      notifier.updateCharacterInList(
        existingCharacter.copyWith(
          lastUpdateTime: DateTime.now().millisecondsSinceEpoch,
        ),
      );

      notifier.upgradeCharacterState(id: '5', isInCombat: true);

      final updatedChar = container.read(selectionProvider).value!.first;
      expect(updatedChar.isInCombat, true);
      expect(updatedChar.currentHp, 136);
      verify(() => mockRepository.saveCharacter(any())).called(1);
    });

    test('isInCombat: false - зберігає actualHp, а не застиглий currentHp', () {
      existingCharacter = existingCharacter.copyWith(
        lastUpdateTime: DateTime.now()
            .subtract(const Duration(hours: 1))
            .millisecondsSinceEpoch,
      );

      final notifier = container.read(selectionProvider.notifier);
      notifier.updateCharacterInList(existingCharacter);

      notifier.upgradeCharacterState(id: '5', isInCombat: false);

      final updatedChar = container.read(selectionProvider).value!.first;
      expect(updatedChar.currentHp, 170);
    });

    test('gainedExp підвищує рівень, currentHp скидається до нового maxHp', () {
      final notifier = container.read(selectionProvider.notifier);

      notifier.upgradeCharacterState(id: '5', gainedExp: 10);

      final updatedChar = container.read(selectionProvider).value!.first;
      expect(updatedChar.level, 1);
      expect(updatedChar.currentHp, updatedChar.maxHp);
    });
  });
}
