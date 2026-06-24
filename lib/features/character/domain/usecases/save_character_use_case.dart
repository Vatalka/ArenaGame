import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_character_use_case.g.dart';

class SaveCharacterUseCase {
  final ICharacterRepository _repository;

  SaveCharacterUseCase(this._repository);

  Future<void> call(Character character) async {
    await _repository.saveCharacter(character);
  }
}

@riverpod
SaveCharacterUseCase saveCharacterUseCase(Ref ref) {
  final repository = ref.watch(characterRepositoryProvider);
  return SaveCharacterUseCase(repository);
}
