import 'package:arena_game/features/battle/presentation/controllers/player_notifier.dart';
import 'package:arena_game/features/character/presentation/controllers/selection_notifier.dart';
import 'package:arena_game/features/battle/domain/entities/battle_selection.dart';
import 'package:arena_game/features/log/domain/entities/battle_log_item.dart';
import 'package:arena_game/features/battle/presentation/controllers/bot_notifier.dart';
import 'package:arena_game/features/log/presentation/controllers/battle_log_notifier.dart';
import 'package:arena_game/features/battle/presentation/controllers/active_player_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'battle_notifier.g.dart';

@riverpod
class BattleNotifier extends _$BattleNotifier {
  @override
  BattleSelection build() => const BattleSelection();

  void selectAttack(Area? area) => state = state.copyWith(selectedAttack: area);

  void selectBlock(Area? area) => state = state.copyWith(selectedBlock: area);

  void enableBotMode() {
    final String playerId = ref.read(playerProvider);
    final bot = ref.read(botProvider);

    ref
        .read(selectionProvider.notifier)
        .upgradeCharacterState(id: playerId, isInCombat: true);

    final player = ref.read(activePlayerProvider);

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
    final player = ref.read(activePlayerProvider);

    ref
        .read(selectionProvider.notifier)
        .upgradeCharacterState(id: player.id, isInCombat: false);

    state = state.copyWith(isBotMode: false);
  }

  void confirmTurn() {
    if (!state.isBotMode) return;

    ref.read(battleLogProvider.notifier).addRoundLog(state.roundNumber);

    _processPlayerTurn();
    _processBotTurn();
    _checkBattleOver();

    state = state.copyWith(
      selectedAttack: null,
      selectedBlock: null,
      roundNumber: state.roundNumber + 1,
    );
  }

  void skipTurn() {
    if (!state.isBotMode) return;

    // 1) повний пропуск - потрібна буде null перевірка у _processBotTurn()
    // state = state.copyWith(selectedAttack: null, selectedBlock: null);

    // 2) getRandomArea()
    final randomAttack = ref.read(botProvider.notifier).getRandomArea();
    final randomBlock = ref.read(botProvider.notifier).getRandomArea();

    state = state.copyWith(
      selectedAttack: randomAttack,
      selectedBlock: randomBlock,
    );

    ref
        .read(battleLogProvider.notifier)
        .addInfoLog('Гравець дизорієнтований...');

    confirmTurn();
  }

  void _processPlayerTurn() {
    final player = ref.read(activePlayerProvider);
    final bot = ref.read(botProvider);

    final playerAttackArea = state.selectedAttack;
    final botBlockArea = ref.read(botProvider.notifier).getTestArea(); // test

    int damageToBot = player.strength * 2;

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

    final botAttackArea = ref.read(botProvider.notifier).getTestArea(); // test
    final playerBlockArea = state.selectedBlock;

    int damageToPlayer = bot.strength * 2;

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

    final newHp = player.currentHp - damageToPlayer;

    ref
        .read(selectionProvider.notifier)
        .upgradeCharacterState(id: player.id, newHp: newHp, isInCombat: true);
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

      int expReward = 0;
      if (result == BattleResult.playerWin) {
        expReward = bot.maxHp ~/ 10;
      }

      ref
          .read(selectionProvider.notifier)
          .upgradeCharacterState(
            id: player.id,
            newHp: player.currentHp,
            gainedExp: expReward,
          );
      disableBotMode();
    }
  }
}
