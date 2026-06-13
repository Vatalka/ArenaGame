import 'package:arena_game/core/widgets/game_tooltip.dart';
import 'package:arena_game/core/widgets/stroke_text.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/presentation/widgets/experience_bar.dart';
import 'package:arena_game/features/character/presentation/widgets/health_bar.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final hpPercent = character.maxHp > 0
        ? character.currentHp / character.maxHp
        : 0.0;
    final xpPercent = character.nextLevelExp > 0
        ? character.experience / character.nextLevelExp
        : 0.0;

    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            // Level & name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GameTooltip(
                  message: 'level',
                  child: Text('[${character.level}] '),
                ),
                Text(
                  character.name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),

            // Hit Points
            Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      HealthBar(hp: hpPercent),
                      Positioned(
                        left: 5,
                        child: StrokeText(
                          text: 'HP',
                          fontSize: 11,
                          textColor: colorScheme.surface,
                          strokeColor: colorScheme.onSurface,
                        ),
                      ),
                      Positioned(
                        right: 5,
                        child: Text(
                          '${character.currentHp}/${character.maxHp}',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Experience & stats
            GameTooltip(
              message:
                  'experience ${character.experience}/${character.nextLevelExp}',
              child: ExperienceBar(xp: xpPercent),
            ),
            GameTooltip(
              message: '1 vitality = 10 HP',
              child: Text('VIT: ${character.vitality}'),
            ),
            GameTooltip(
              message: '1 strength = 2 damage',
              child: Text('STR: ${character.strength}'),
            ),
          ],
        ),
      ),
    );
  }
}
