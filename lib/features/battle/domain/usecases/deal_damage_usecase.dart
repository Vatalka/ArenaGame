import 'package:arena_game/features/battle/presentation/controller/player_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DealDamageUseCase {
  final Ref ref;

  DealDamageUseCase(this.ref);

  void execute() {
    final currentPlayer = ref.read(playerProvider);

    ref.read(playerProvider.notifier).dealDamage(currentPlayer.strength);
  }
}

final dealDealDamageUseCaseProvider = Provider((ref) => DealDamageUseCase(ref));
