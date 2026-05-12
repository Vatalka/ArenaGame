import 'package:arena_game/features/battle/presentation/controller/battle_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttackConfirmButton extends ConsumerWidget {
  const AttackConfirmButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(battleProvider);
    return ElevatedButton(
      onPressed: state.isTurnReady
          ? ref.read(battleProvider.notifier).confirmTurn
          : null,
      child: const Text("Attack"),
    );
  }
}
