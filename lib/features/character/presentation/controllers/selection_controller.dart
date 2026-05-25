import 'package:arena_game/features/battle/presentation/controllers/player_notifier.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selection_controller.g.dart';

@riverpod
class SelectionController extends _$SelectionController {
  @override
  FutureOr<List<Character>> build() async {
    return ref.watch(characterRepositoryProvider).getAllCharacters();
  }

  Future<void> removeCharacter(String id) async {
    try {
      state = const AsyncValue.loading();
      await ref.read(characterRepositoryProvider).deleteCharacter(id);
      ref.invalidateSelf();
      ref.invalidate(playerProvider);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      if (kDebugMode) {
        print('Unable to delete character: $e');
      }
    }
  }
}
