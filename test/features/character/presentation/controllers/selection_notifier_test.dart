import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:arena_game/features/character/presentation/controllers/selection_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterRepository extends Mock implements ICharacterRepository {}

void main() {
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
      Character.createNew().copyWith(id: '1', name: 'FakeAragon'),
    ];
    when(
      () => mockRepository.getAllCharacters(),
    ).thenAnswer((_) async => fakeCharacters);

    final result = await container.read(selectionProvider.future);

    expect(result, fakeCharacters);
    verify(() => mockRepository.getAllCharacters()).called(1);
  });
}
