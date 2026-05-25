import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/presentation/widgets/health_bar.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final hpPercent = character.currentHp / character.maxHp;
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
            Text('VIT: ${character.vitality}'),
            Text('STR: ${character.strength}'),
          ],
        ),
      ),
    );
  }
}
