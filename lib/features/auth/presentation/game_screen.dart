import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/core/widgets/health_bar.dart';
import 'package:arena_game/features/character/domain/player_notifier.dart';
import 'package:arena_game/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(playerProvider);

    final enemy = ref.read(characterRepositoryProvider).getHero('Enemy');

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
                // Player
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
                // Actions
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(4),
                        minimumSize: Size(50, 0),
                      ),
                      onPressed: () =>
                          ref.read(playerProvider.notifier).takeDamage(7),
                      child: const Icon(
                        Icons.battery_0_bar,
                        size: 24,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          ref.read(playerProvider.notifier).restoreHp(),
                      child: Icon(Icons.refresh),
                    ),
                  ],
                ),
                // Enemy
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(enemy.name),
                    Text('HP: ${enemy.currentHp} / ${enemy.maxHp}'),
                    SizedBox(
                      width: 200,
                      height: 10,
                      child: LinearProgressIndicator(
                        value:
                            enemy.maxHp > 0 ? enemy.currentHp / enemy.maxHp : 0,
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          enemy.currentHp / enemy.maxHp < 0.4
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(context)
                                  .extension<GameColors>()!
                                  .health,
                        ),
                      ),
                    ),
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
