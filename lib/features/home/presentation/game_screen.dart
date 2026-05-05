import 'package:arena_game/features/battle/domain/usecases/restore_all_hp_usecase.dart';
import 'package:arena_game/features/battle/presentation/controller/battle_notifier.dart';
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
    final player = ref.watch(characterNotifierProvider('Player'));
    final enemy = ref.watch(characterNotifierProvider('Enemy'));

    final state = ref.watch(battleNotifierProvider);
    final controller = ref.read(battleNotifierProvider.notifier);

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
                CharacterStatCard(character: player),
                // Restore HP Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      minimumSize: Size(0, 0),
                    ),
                    onPressed: () =>
                        ref.read(restoreAllHpUseCaseProvider).execute(),
                    child: Icon(
                      Icons.refresh,
                      size: 24,
                    ),
                  ),
                ),
                CharacterStatCard(character: enemy),
              ],
            ),
            Column(
              children: [
                SelectionGroup(
                  title: "Оберіть куди вдарити",
                  currentSelection: state.selectedAttack,
                  onSelected: (area) => controller.selectAttack(area),
                ),
                SelectionGroup(
                  title: "Оберіть що захистити",
                  currentSelection: state.selectedBlock,
                  onSelected: (area) => controller.selectedBlock(area),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: (state.selectedAttack != null &&
                            state.selectedBlock != null)
                        ? () => ref
                            .read(battleNotifierProvider.notifier)
                            .confirmTurn()
                        : null,
                    child: const Text("В БІЙ!"),
                  ),
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
