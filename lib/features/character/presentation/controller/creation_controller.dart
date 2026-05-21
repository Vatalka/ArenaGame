import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:arena_game/features/character/presentation/controller/selection_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'creation_controller.g.dart';

@riverpod
class CreationController extends _$CreationController {
  @override
  Character build() => Character.createDefault();

  void updateName(String name) => state = state.copyWith(name: name);

  Future<void> createAndSave() async {
    await ref.read(characterRepositoryProvider).saveCharacter(state);
    ref.invalidate(selectionControllerProvider);
  }
}
