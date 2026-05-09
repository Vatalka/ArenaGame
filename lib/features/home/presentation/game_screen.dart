import 'package:arena_game/features/battle/presentation/controller/battle_notifier.dart';
import 'package:arena_game/features/battle/presentation/widgets/restore_hp_button.dart';
import 'package:arena_game/features/battle/presentation/widgets/selection_group.dart';
import 'package:arena_game/features/character/presentation/controller/character_notifier.dart';
import 'package:arena_game/features/character/presentation/widgets/character_stat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(battleProvider);
    final controller = ref.read(battleProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text('Game Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CharacterStatCard(
                  character: ref.watch(characterProvider('Player')),
                ),
                RestoreHpButton(),
                CharacterStatCard(
                  character: ref.watch(characterProvider('Enemy')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectionGroup(
                  title: 'Attack',
                  currentSelection: state.selectedAttack,
                  onSelected: (area) => controller.selectAttack(area),
                ),
                SizedBox(height: 8, width: 8),
                SelectionGroup(
                  title: 'Block',
                  currentSelection: state.selectedBlock,
                  onSelected: (area) => controller.selectedBlock(area),
                ),
              ],
            ),
            ElevatedButton(
              onPressed:
                  (state.selectedAttack != null && state.selectedBlock != null)
                  ? () => ref.read(battleProvider.notifier).confirmTurn()
                  : null,
              child: const Text("В БІЙ!"),
            ),
            SizedBox(height: 8, width: 8),
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
