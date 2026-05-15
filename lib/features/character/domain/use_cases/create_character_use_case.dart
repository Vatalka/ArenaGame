import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';

class CreateCharacterUseCase {
  final ICharacterRepository repository;

  CreateCharacterUseCase(this.repository);

  Future<void> execute() async {
    final defaultCharacter = Character.createDefault();
    final newCharacter = defaultCharacter.copyWith(name: defaultCharacter.name);
    await repository.saveCharacter(newCharacter);
  }
}
