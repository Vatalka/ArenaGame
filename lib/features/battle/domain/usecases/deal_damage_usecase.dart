import 'package:arena_game/features/character/presentation/controller/character_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DealDamageUseCase {
  final Ref ref;

  DealDamageUseCase(this.ref);

  void execute() {
    final player = ref.read(characterProvider);
    final enemy = ref.read(characterProvider);

    ref
        .read(characterProvider.notifier)
        .dealDamage(enemy.strength);
    ref
        .read(characterProvider.notifier)
        .dealDamage(player.strength);
  }
}

final dealDealDamageUseCaseProvider = Provider((ref) => DealDamageUseCase(ref));
