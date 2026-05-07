import 'package:arena_game/features/character/presentation/controller/character_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestoreAllHpUseCase {
  final Ref ref;

  RestoreAllHpUseCase({required this.ref});

  void execute() {
    ref.read(characterProvider('Player').notifier).restoreHp();
    ref.read(characterProvider('Enemy').notifier).restoreHp();
  }
}

final restoreAllHpUseCaseProvider =
    Provider((ref) => RestoreAllHpUseCase(ref: ref));
