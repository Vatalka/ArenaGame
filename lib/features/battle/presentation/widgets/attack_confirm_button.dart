import 'package:arena_game/features/battle/presentation/controllers/battle_notifier.dart';
import 'package:arena_game/features/battle/presentation/widgets/turn_timer_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttackConfirmButton extends ConsumerWidget {
  const AttackConfirmButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(battleProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: state.isTurnReady
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.secondaryContainer,
          ),
          onPressed: state.isTurnReady && state.isBotMode
              ? ref.read(battleProvider.notifier).confirmTurn
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Attack", style: TextStyle(fontWeight: FontWeight.bold)),
              TurnTimerIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
