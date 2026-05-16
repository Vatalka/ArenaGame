import 'package:arena_game/features/battle/presentation/controller/player_notifier.dart';
import 'package:arena_game/features/character/presentation/widgets/health_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterStatCard extends ConsumerWidget {
  const CharacterStatCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final character = ref.watch(playerProvider);
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
