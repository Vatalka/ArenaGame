import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:arena_game/features/character/presentation/controllers/selection_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'creation_notifier.g.dart';

@riverpod
class CreationNotifier extends _$CreationNotifier {
  @override
  Character build() => Character.createNew();

  void updateName(String name) => state = state.copyWith(name: name);

  Future<String?> createAndSave() async {
    try {
      await ref.read(characterRepositoryProvider).saveCharacter(state);
      ref.invalidate(selectionProvider);
      return null;
    } catch (e) {
      return 'Не вдалося створити персонажа: ${e.toString()}';
    }
  }
}
