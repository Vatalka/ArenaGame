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
  late Character existingCharacter;

  setUp(() {
    mockRepository = MockCharacterRepository();
    container = ProviderContainer(
      overrides: [
        characterRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );

    existingCharacter = Character.createNew().copyWith(
      id: '5',
      name: 'FakeAragon',
      vitality: 17,
      currentHp: 136,
      isInCombat: false,
      lastUpdateTime: 0,
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

  Future<void> setupLoadedState() async {
    when(
      () => mockRepository.getAllCharacters(),
    ).thenAnswer((_) async => [existingCharacter]);

    when(() => mockRepository.saveCharacter(any())).thenAnswer((_) async {});
    await container.read(selectionProvider.future);
  }

  group('setCombatState', () {
    setUp(() async => await setupLoadedState());

    test('id не знайдено в списку — стан не змінюється', () {
      final notifier = container.read(selectionProvider.notifier);

      notifier.setCombatState(id: 'unknown-id', isInCombat: true);

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

      notifier.setCombatState(id: '5', isInCombat: true);

      final updatedChar = container.read(selectionProvider).value!.first;
      expect(updatedChar.isInCombat, true);
      expect(updatedChar.currentHp, 136);
      verify(() => mockRepository.saveCharacter(any())).called(1);
    });

    test('isInCombat: false - зберігає actualHp', () {
      existingCharacter = existingCharacter.copyWith(
        lastUpdateTime: DateTime.now()
            .subtract(const Duration(hours: 1))
            .millisecondsSinceEpoch,
      );

      final notifier = container.read(selectionProvider.notifier);
      notifier.updateCharacterInList(existingCharacter);

      notifier.setCombatState(id: '5', isInCombat: false);

      final updatedChar = container.read(selectionProvider).value!.first;
      expect(updatedChar.currentHp, 170);
    });
  });

  group('applyExperience', () {
    setUp(() async => await setupLoadedState());

    test('gainedExp підвищує рівень, currentHp скидається до нового maxHp', () {
      final notifier = container.read(selectionProvider.notifier);

      notifier.applyExperience(id: '5', gainedExp: 10);

      final updatedChar = container.read(selectionProvider).value!.first;
      expect(updatedChar.level, 1);
      expect(updatedChar.currentHp, updatedChar.maxHp);
    });
  });

  group('takeDamage', () {
    setUp(() async => await setupLoadedState());

    test('зменшує currentHp та не опускається нижче нуля', () {
      final notifier = container.read(selectionProvider.notifier);

      notifier.takeDamage(id: '5', damage: 36);
      expect(container.read(selectionProvider).value!.first.currentHp, 100);

      notifier.takeDamage(id: '5', damage: 150);
      expect(container.read(selectionProvider).value!.first.currentHp, 0);

      verify(() => mockRepository.saveCharacter(any())).called(2);
    });
  });

  group('updateCharacterInList', () {
    setUp(() async => await setupLoadedState());

    test('успішно оновлює State персонажа БЕЗ виклику репозиторію', () {
      final notifier = container.read(selectionProvider.notifier);

      final upgradedChar = existingCharacter.copyWith(
        vitality: 20,
        strength: 20,
        level: 2,
      );

      notifier.updateCharacterInList(upgradedChar);

      final state = container.read(selectionProvider).value!;
      expect(state.first.level, 2);
      expect(state.first.vitality, 20);

      verifyNever(() => mockRepository.saveCharacter(any()));
    });

    test('id не знайдено в списку — стан залишається незмінним', () {
      final notifier = container.read(selectionProvider.notifier);
      final unknownChar = existingCharacter.copyWith(id: 'id', name: 'Name');

      notifier.updateCharacterInList(unknownChar);

      final state = container.read(selectionProvider).value!;
      expect(state.first.id, '5');
      expect(state.first.name, 'FakeAragon');
    });
  });

  group('removeCharacter', () {
    test('успішно видаляє персонажа та викликає invalidateSelf()', () async {
      when(() => mockRepository.deleteCharacter('5')).thenAnswer((_) async {});

      final notifier = container.read(selectionProvider.notifier);
      final future = notifier.removeCharacter('5');

      expect(
        container.read(selectionProvider),
        const AsyncLoading<List<Character>>(),
      );

      await future;
      verify(() => mockRepository.deleteCharacter('5')).called(1);
    });

    test('у разі помилки репозиторію - перехід State в AsyncError', () async {
      final exception = Exception('Database error');

      when(
        () => mockRepository.deleteCharacter('5'),
      ).thenAnswer((_) async => throw exception);

      final notifier = container.read(selectionProvider.notifier);

      await notifier.removeCharacter('5');

      final state = container.read(selectionProvider);
      expect(state, isA<AsyncError<List<Character>>>());
      expect(state.error, exception);
    });
  });
}
