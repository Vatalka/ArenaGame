import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/core/widgets/health_bar.dart';
import 'package:arena_game/features/character/domain/repositories/character_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double hp = 1;

  void takeDamage() {
    setState(() {
      hp = (hp - 0.15).clamp(0, hp);
    });
  }

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
                    HealthBar(currentHP: hp),
                    Text('VIT: ${player.vitality}'),
                    Text('STR: ${player.strength}'),
                    Text('PRE: ${player.precision}'),
                    Text('AGI: ${player.agility}'),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: takeDamage,
                      child: Icon(Icons.battery_0_bar),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          hp = 1;
                        });
                      },
                      child: Icon(Icons.battery_charging_full),
                    ),
                  ],
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
