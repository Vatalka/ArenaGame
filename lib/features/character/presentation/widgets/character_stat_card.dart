import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/presentation/widgets/health_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterStatCard extends ConsumerWidget {
  final Character character;

  const CharacterStatCard({super.key, required this.character});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hpPercent = character.currentHp / character.maxHp;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(character.name),
        Text('HP: ${character.currentHp} / ${character.maxHp}'),
        HealthBar(hp: hpPercent),
        Text('VIT: ${character.vitality}'),
        Text('STR: ${character.strength}'),
      ],
    );
  }
}
