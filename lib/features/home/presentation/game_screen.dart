import 'package:arena_game/features/battle/presentation/controllers/battle_notifier.dart';
import 'package:arena_game/features/battle/presentation/controllers/bot/bot_notifier.dart';
import 'package:arena_game/features/battle/presentation/controllers/player/player_notifier.dart';
import 'package:arena_game/features/battle/presentation/widgets/attack_confirm_button.dart';
import 'package:arena_game/features/battle/presentation/widgets/battle_mode_selector.dart';
import 'package:arena_game/features/battle/presentation/widgets/log/battle_log_view.dart';
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
    final gameMode = ref.watch(battleProvider);
    final player = ref.watch(playerProvider);
    final bot = ref.watch(botProvider);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        Modular.to.navigate('/selection');
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: BattleLogView()),
                Row(
                  children: [
                    Expanded(child: CharacterCard(character: player)),
                    Expanded(
                      child: gameMode.isBotMode
                          ? CharacterCard(character: bot)
                          : const BattleModeSelector(),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SelectionGroup(
                        title: 'Attack',
                        currentSelection: ref
                            .watch(battleProvider)
                            .selectedAttack,
                        onSelected: (area) => ref
                            .read(battleProvider.notifier)
                            .selectAttack(area),
                      ),
                    ),
                    Expanded(
                      child: SelectionGroup(
                        title: 'Block',
                        currentSelection: ref
                            .watch(battleProvider)
                            .selectedBlock,
                        onSelected: (area) =>
                            ref.read(battleProvider.notifier).selectBlock(area),
                      ),
                    ),
                  ],
                ),
                AttackConfirmButton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => Modular.to.navigate('/selection'),
                      child: Text('Select'),
                    ),
                    RestoreHpButton(
                      onTap: () {
                        ref.read(playerProvider.notifier).restoreHp();
                      },
                    ),
                    ElevatedButton(
                      onPressed: () => Modular.to.navigate('/'),
                      child: Text('Login'),
                    ),
                  ],
                ),
                SizedBox(height: 8, width: 8),
                Expanded(
                  child: Placeholder(child: Center(child: Text('Game Chat'))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
