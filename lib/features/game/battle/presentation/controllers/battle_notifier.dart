import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:arena_game/features/character/presentation/controllers/selection_notifier.dart';
import 'package:arena_game/features/game/battle/domain/entities/battle_selection.dart';
import 'package:arena_game/features/game/log/domain/entities/battle_log_item.dart';
import 'package:arena_game/features/game/bot/bot_notifier.dart';
import 'package:arena_game/features/game/log/presentation/controllers/battle_log_notifier.dart';
import 'package:arena_game/features/game/player/active_player.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'battle_notifier.g.dart';

@riverpod
class BattleNotifier extends _$BattleNotifier {
  @override
  BattleSelection build() => const BattleSelection();

  void selectAttack(Area? area) => state = state.copyWith(selectedAttack: area);

  void selectBlock(Area? area) => state = state.copyWith(selectedBlock: area);

  void enableBotMode() {
    final player = ref.read(activePlayerProvider);
    final bot = ref.read(botProvider);

    state = state.copyWith(
      isBotMode: true,
      selectedAttack: null,
      selectedBlock: null,
    );

    ref
        .read(battleLogProvider.notifier)
        .addStartBattleLog(player.name, bot.name);
  }

  void disableBotMode() {
    state = state.copyWith(isBotMode: false);
  }

  void confirmTurn() {
    if (!state.isBotMode) return;
    _processPlayerTurn();
    _processBotTurn();
    _checkBattleOver();
  }

  void _processPlayerTurn() {
    final player = ref.read(activePlayerProvider);
    final bot = ref.read(botProvider);

    final playerAttackArea = state.selectedAttack;
    final botBlockArea = ref.read(botProvider.notifier).getRandomArea();

    int damageToBot = player.strength;

    if (playerAttackArea == botBlockArea) {
      damageToBot = 0;
      ref
          .read(battleLogProvider.notifier)
          .addBlockLog(bot.name, playerAttackArea!);
    } else {
      ref
          .read(battleLogProvider.notifier)
          .addAttackLog(player.name, playerAttackArea!, damageToBot);
    }

    ref.read(botProvider.notifier).takeDamage(damageToBot);
  }

  void _processBotTurn() {
    final player = ref.read(activePlayerProvider);
    final bot = ref.read(botProvider);

    final botAttackArea = ref.read(botProvider.notifier).getRandomArea();
    final playerBlockArea = state.selectedBlock;

    int damageToPlayer = bot.strength;

    if (botAttackArea == playerBlockArea) {
      damageToPlayer = 0;
      ref
          .read(battleLogProvider.notifier)
          .addBlockLog(player.name, botAttackArea);
    } else {
      ref
          .read(battleLogProvider.notifier)
          .addAttackLog(bot.name, botAttackArea, damageToPlayer);
    }

    final newHP = player.currentHp - damageToPlayer;

    ref.read(selectionProvider.notifier).updateCharacterHP(player.id, newHP);
  }

  void _checkBattleOver() {
    final player = ref.read(activePlayerProvider);
    final bot = ref.read(botProvider);

    final isPlayerLose = player.currentHp <= 0;
    final isBotLose = bot.currentHp <= 0;

    if (isPlayerLose || isBotLose) {
      final (result, winnerName) = switch ((isPlayerLose, isBotLose)) {
        (false, true) => (BattleResult.playerWin, player.name),
        (true, false) => (BattleResult.botWin, bot.name),
        _ => (BattleResult.draw, ''),
      };

      ref.read(battleLogProvider.notifier).addEndBattleLog(result, winnerName);
      disableBotMode();
      ref.read(characterRepositoryProvider).saveCharacter(player);
      ref.invalidate(selectionProvider);
    }
  }
}
