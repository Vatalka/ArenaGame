import 'package:arena_game/core/widgets/health_bar.dart';
import 'package:arena_game/features/auth/presentation/character_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(characterProvider('Player'));
    final enemy = ref.watch(characterProvider('Enemy'));

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
                      onPressed: () => {
                        ref
                            .read(characterProvider('Player').notifier)
                            .takeDamage(7),
                        ref
                            .read(characterProvider('Enemy').notifier)
                            .takeDamage(11),
                      },
                      child: const Icon(
                        Icons.battery_0_bar,
                        size: 24,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        ref
                            .read(characterProvider('Player').notifier)
                            .restoreHp(),
                        ref
                            .read(characterProvider('Enemy').notifier)
                            .restoreHp(),
                      },
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
