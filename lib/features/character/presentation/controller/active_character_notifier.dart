import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_character_notifier.g.dart';

@riverpod
class ActiveCharacterNotifier extends _$ActiveCharacterNotifier {
  @override
  Character? build() => null;

  void select(Character character) {
    state = character;
  }

  void clear() => state = null;
}
