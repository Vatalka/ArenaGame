import 'package:arena_game/core/widgets/health_bar.dart';
import 'package:arena_game/features/battle/presentation/state_management/battle_notifier.dart';
import 'package:arena_game/features/battle/presentation/widgets/selection_group.dart';
import 'package:arena_game/features/character/presentation/character_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(characterNotifierProvider('Player'));
    final enemy = ref.watch(characterNotifierProvider('Enemy'));

    final state = ref.watch(battleControllerProvider);
    final controller = ref.read(battleControllerProvider.notifier);

    void restoreHp() {
      ref.read(characterNotifierProvider('Player').notifier).restoreHp();
      ref.read(characterNotifierProvider('Enemy').notifier).restoreHp();
    }

    void takeDamage() {
      ref
          .read(characterNotifierProvider('Player').notifier)
          .takeDamage(enemy.strength * 2);
      ref
          .read(characterNotifierProvider('Enemy').notifier)
          .takeDamage(player.strength * 1.6);
    }

    return Scaffold(
      appBar: AppBar(title: Text('Game Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Player information:
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(player.name),
                    Text('HP: ${player.currentHp} / ${player.maxHp}'),
                    HealthBar(hp: player.currentHp / player.maxHp),
                    Text('VIT: ${player.vitality}'),
                    Text('STR: ${player.strength}'),
                    Text('PRE: ${player.precision}'),
                    Text('AGI: ${player.agility}'),
                  ],
                ),
                // Action buttons:
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(4),
                        minimumSize: Size(50, 0),
                      ),
                      onPressed: takeDamage,
                      child: const Icon(
                        Icons.battery_0_bar,
                        size: 24,
                      ),
                    ),
                    SizedBox(height: 4, width: 4),
                    ElevatedButton(
                      onPressed: restoreHp,
                      child: Icon(Icons.refresh),
                    ),
                  ],
                ),
                // Enemy information:
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(enemy.name),
                    Text('HP: ${enemy.currentHp} / ${enemy.maxHp}'),
                    HealthBar(hp: enemy.currentHp / enemy.maxHp),
                    Text('VIT: ${enemy.vitality}'),
                    Text('STR: ${enemy.strength}'),
                    Text('PRE: ${enemy.precision}'),
                    Text('AGI: ${enemy.agility}'),
                  ],
                ),
              ],
            ),
            // Selection Group
            Column(
              children: [
                SelectionGroup(
                  title: "Оберіть куди вдарити",
                  currentSelection: state.selectedAttack,
                  onSelected: (area) => controller.selectAttack(area),
                ),
                SelectionGroup(
                  title: "Оберіть що захистити",
                  currentSelection: state.selectedBlock,
                  onSelected: (area) => controller.selectedBlock(area),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: (state.selectedAttack != null &&
                            state.selectedBlock != null)
                        ? () => controller.confirmTurn()
                        : null,
                    child: const Text("В БІЙ!"),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => Modular.to.navigate('/'),
              child: Text('Back to Login Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
