import 'package:arena_game/features/battle/presentation/controller/battle_notifier.dart';
import 'package:arena_game/features/battle/presentation/controller/player_notifier.dart';
import 'package:arena_game/features/battle/presentation/widgets/attack_confirm_button.dart';
import 'package:arena_game/features/battle/presentation/widgets/restore_hp_button.dart';
import 'package:arena_game/features/battle/presentation/widgets/selection_group.dart';
import 'package:arena_game/features/character/presentation/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeChar = ref.watch(playerProvider);
    final bot = ref.watch(playerProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Placeholder(child: Center(child: Text('Battle Log'))),
            ),
            Row(
              children: [
                Expanded(child: CharacterCard(character: activeChar)),
                Expanded(child: CharacterCard(character: bot)),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SelectionGroup(
                  title: 'Attack',
                  currentSelection: ref.watch(battleProvider).selectedAttack,
                  onSelected: (area) =>
                      ref.read(battleProvider.notifier).selectAttack(area),
                ),
                SelectionGroup(
                  title: 'Block',
                  currentSelection: ref.watch(battleProvider).selectedBlock,
                  onSelected: (area) =>
                      ref.read(battleProvider.notifier).selectBlock(area),
                ),
              ],
            ),
            AttackConfirmButton(),
            RestoreHpButton(
              onTap: () {
                ref.read(playerProvider.notifier).restoreHp();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Modular.to.navigate('/selection'),
                  child: Text('Select'),
                ),
                ElevatedButton(
                  onPressed: () => Modular.to.navigate('/'),
                  child: Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
