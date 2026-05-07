import 'package:arena_game/features/character/presentation/controller/character_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DealDamageUseCase {
  final Ref ref;

  DealDamageUseCase(this.ref);

  void execute() {
    final player = ref.read(characterProvider('Player'));
    final enemy = ref.read(characterProvider('Enemy'));

    ref
        .read(characterProvider('Player').notifier)
        .dealDamage(enemy.strength * 2);
    ref
        .read(characterProvider('Enemy').notifier)
        .dealDamage(player.strength * 2);
  }
}

final dealDealDamageUseCaseProvider = Provider((ref) => DealDamageUseCase(ref));
