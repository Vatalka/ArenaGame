import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/core/widgets/health_bar.dart';
import 'package:arena_game/features/character/domain/repositories/character_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Modular.get<CharacterRepository>();

    final player = repository.getHero('Player');
    final enemy = repository.getHero('Enemy');

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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(player.name),
                    Text('HP: ${player.currentHp} / ${player.maxHp}'),
                    SizedBox(
                      width: 200,
                      height: 10,
                      child: LinearProgressIndicator(
                        value: player.maxHp > 0
                            ? player.currentHp / player.maxHp
                            : 0,
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          player.currentHp / player.maxHp < 0.3
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(context)
                                  .extension<GameColors>()!
                                  .health,
                        ),
                      ),
                    ),
                    HealthBar(currentHP: 1 - 0.1),
                    Text('VIT: ${player.vitality}'),
                    Text('STR: ${player.strength}'),
                    Text('PRE: ${player.precision}'),
                    Text('AGI: ${player.agility}'),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
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
                          enemy.currentHp / enemy.maxHp < 0.3
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
