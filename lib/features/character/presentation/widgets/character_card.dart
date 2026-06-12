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
            Text(
              character.name,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text('HP: ${character.currentHp} / ${character.maxHp}'),
            HealthBar(hp: hpPercent),
            Text('EXP: ${character.experience} / ${character.nextLevelExp}'),
            ExperienceBar(xp: xpPercent),
            Tooltip(
              message: "Vitality: 1 VIT = 10 Hit Points",
              triggerMode: TooltipTriggerMode.tap,
              preferBelow: false,
              child: Text('VIT: ${character.vitality}'),
            ),
            Tooltip(
              message: "Strength: 1 STR = 1 Damage",
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
