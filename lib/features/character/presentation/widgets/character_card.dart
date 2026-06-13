import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/presentation/widgets/experience_bar.dart';
import 'package:arena_game/features/character/presentation/widgets/health_bar.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final hpPercent = character.currentHp / character.maxHp;
    final xpPercent = character.experience / character.nextLevelExp;

    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Tooltip(
                  message: "level",
                  triggerMode: TooltipTriggerMode.tap,
                  preferBelow: false,
                  child: Text('[${character.level}] '),
                ),
                Text(
                  character.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      HealthBar(hp: hpPercent),
                      Positioned(
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Stack(
                            children: [
                              Text(
                                'HP',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2.0
                                    ..color = Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                'HP',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
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
            Tooltip(
              message:
                  'experience ${character.experience}/${character.nextLevelExp}',
              triggerMode: TooltipTriggerMode.tap,
              preferBelow: false,
              child: ExperienceBar(xp: xpPercent),
            ),
            Tooltip(
              message: '1 vitality = 10 HP',
              triggerMode: TooltipTriggerMode.tap,
              preferBelow: false,
              child: Text('VIT: ${character.vitality}'),
            ),
            Tooltip(
              message: '1 strength = 2 damage',
              triggerMode: TooltipTriggerMode.tap,
              preferBelow: false,
              child: Text('STR: ${character.strength}'),
            ),
          ],
        ),
      ),
    );
  }
}
