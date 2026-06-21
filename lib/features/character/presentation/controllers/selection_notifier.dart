import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selection_notifier.g.dart';

@riverpod
class SelectionNotifier extends _$SelectionNotifier {
  @override
  FutureOr<List<Character>> build() async {
    final repository = ref.watch(characterRepositoryProvider);
    return _loadCharacters(repository);
  }

  Future<List<Character>> _loadCharacters(ICharacterRepository repo) async {
    return await repo.getAllCharacters();
  }

  // TODO(refactor): порушує SRP.
  void upgradeCharacterState({
    required String id,
    int? newHp,
    bool? isInCombat,
    int? addedVitality,
    int? addedStrength,
    int? remainingPoints,
    int? gainedExp,
  }) {
    if (state is! AsyncData<List<Character>>) return;

    final currentList = state.value!;
    final index = currentList.indexWhere((char) => char.id == id);
    if (index == -1) return;

    final oldChar = currentList[index];

    var updatedChar = oldChar.copyWith(
      isInCombat: isInCombat ?? oldChar.isInCombat,
      lastUpdateTime: DateTime.now().millisecondsSinceEpoch,
    );

    bool leveledUp = false;
    if ((gainedExp ?? 0) > 0) {
      updatedChar = updatedChar.earnExperience(gainedExp!);
      if (updatedChar.level > oldChar.level) {
        leveledUp = true;
      }
    }

    updatedChar = updatedChar.copyWith(
      currentHp: leveledUp
          ? updatedChar.maxHp
          : (newHp ??
                (isInCombat == true
                    ? oldChar.actualHp.toInt()
                    : oldChar.currentHp)),
      vitality: oldChar.vitality + (addedVitality ?? 0),
      strength: oldChar.strength + (addedStrength ?? 0),
      statPoints: remainingPoints ?? oldChar.statPoints,
    );

    if (oldChar == updatedChar) return;

    ref.read(characterRepositoryProvider).saveCharacter(updatedChar);

    final updatedList = [...currentList];
    updatedList[index] = updatedChar;
    state = AsyncData(updatedList);
  }

  Future<void> removeCharacter(String id) async {
    state = const AsyncLoading();
    try {
      await ref.read(characterRepositoryProvider).deleteCharacter(id);
      ref.invalidateSelf();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
