import 'package:arena_game/features/character/presentation/controller/character_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DealDamageUseCase {
  final Ref ref;

  DealDamageUseCase(this.ref);

  void execute() {
    final player = ref.read(characterNotifierProvider('Player'));
    final enemy = ref.read(characterNotifierProvider('Enemy'));

    ref
        .read(characterNotifierProvider('Player').notifier)
        .dealDamage(enemy.strength * 2);
    ref
        .read(characterNotifierProvider('Enemy').notifier)
        .dealDamage(player.strength * 2);
  }
}

final dealDealDamageUseCaseProvider = Provider((ref) => DealDamageUseCase(ref));
