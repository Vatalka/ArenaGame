import 'package:arena_game/features/battle/presentation/controller/player_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestoreAllHpUseCase {
  final Ref ref;

  RestoreAllHpUseCase({required this.ref});

  void execute() {
    ref.read(playerProvider.notifier).restoreHp();
  }
}

final restoreAllHpUseCaseProvider = Provider(
  (ref) => RestoreAllHpUseCase(ref: ref),
);
