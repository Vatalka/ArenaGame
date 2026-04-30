import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/core/widgets/health_bar.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/repositories/character_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Character player;
  double hp = 1;

  @override
  void initState() {
    super.initState();
    player = Modular.get<CharacterRepository>().getHero('Player');
  }

  void takeDamage() {
    setState(() {
      player = player.copyWith(
          currentHp: (player.currentHp - 7).clamp(0, player.maxHp));
    });
  }

  void restoreHp() {
    setState(() {
      player = player.copyWith(currentHp: player.maxHp);
    });
  }

  @override
  Widget build(BuildContext context) {
    final repository = Modular.get<CharacterRepository>();

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
                    HealthBar(hp: player.currentHp / player.maxHp),
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
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(4),
                        minimumSize: Size(50, 0),
                      ),
                      onPressed: takeDamage,
                      child: Icon(
                        Icons.battery_0_bar,
                        size: 24,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: restoreHp,
                      child: Icon(Icons.refresh),
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
