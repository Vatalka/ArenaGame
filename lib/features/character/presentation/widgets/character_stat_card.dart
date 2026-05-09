import 'package:arena_game/core/widgets/health_bar.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:flutter/widgets.dart';

class CharacterStatCard extends StatelessWidget {
  final Character character;

  const CharacterStatCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final hpPercent = character.currentHp / character.maxHp;
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(character.name),
          Text('HP: ${character.currentHp} / ${character.maxHp}'),
          HealthBar(hp: hpPercent),
          Text('VIT: ${character.vitality}'),
          Text('STR: ${character.strength}'),
        ],
      ),
    );
  }
}
