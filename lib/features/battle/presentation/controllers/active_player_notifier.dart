import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/presentation/controllers/selection_notifier.dart';
import 'package:arena_game/features/battle/presentation/controllers/player_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_player_notifier.g.dart';

@riverpod
Character activePlayerNotifier(Ref ref) {
  final activeId = ref.watch(playerProvider);
  final selectionState = ref.watch(selectionProvider);

  if (activeId.isEmpty) {
    return Character.createEmpty();
  }

  if (selectionState is AsyncData<List<Character>>) {
    return selectionState.value.firstWhere(
      (char) => char.id == activeId,
      orElse: () => Character.createEmpty(),
    );
  }
  return Character.createEmpty();
}
