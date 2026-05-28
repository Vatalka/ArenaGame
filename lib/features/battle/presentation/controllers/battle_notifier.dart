import 'dart:math';
import 'package:arena_game/features/battle/domain/entities/battle_selection.dart';
import 'package:arena_game/features/battle/presentation/controllers/bot/bot_notifier.dart';
import 'package:arena_game/features/battle/presentation/controllers/log/battle_log_notifier.dart';
import 'package:arena_game/features/battle/presentation/controllers/player/player_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'battle_notifier.g.dart';

@riverpod
class BattleNotifier extends _$BattleNotifier {
  @override
  BattleSelection build() => const BattleSelection();

  void selectAttack(Area? area) => state = state.copyWith(selectedAttack: area);

  void selectBlock(Area? area) => state = state.copyWith(selectedBlock: area);

  void enableBotMode() {
    final player = ref.read(playerProvider);
    final bot = ref.read(botProvider);

    state = state.copyWith(
      isBotMode: true,
      selectedAttack: null,
      selectedBlock: null,
    );

    ref
        .read(battleLogProvider.notifier)
        .addInfoLog('Почався бій між ${player.name} та ${bot.name}');
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
    final player = ref.read(playerProvider);
    final bot = ref.read(botProvider);

    final playerAttackArea = state.selectedAttack;
    final botBlockArea = _getRandomArea();

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
    final player = ref.read(playerProvider);
    final bot = ref.read(botProvider);

    final botAttackArea = _getRandomArea();
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

    ref.read(playerProvider.notifier).takeDamage(damageToPlayer);
  }

  Area _getRandomArea() {
    final random = Random();
    final areas = Area.values;
    final randomIndex = random.nextInt(areas.length);
    return areas[randomIndex];
  }

  void _checkBattleOver() {
    final player = ref.read(playerProvider);
    final bot = ref.read(botProvider);

    final isPlayerLose = player.currentHp <= 0;
    final isBotLose = bot.currentHp <= 0;

    if (isPlayerLose || isBotLose) {
      String gameOverMessage = '';

      if (isPlayerLose && isBotLose) {
        gameOverMessage = 'Бій завершено нічиєю! Обидва бійці непритомні!';
      } else if (isBotLose) {
        gameOverMessage = 'Бій завершено! Переміг ${player.name}!';
      } else if (isPlayerLose) {
        gameOverMessage =
            'Бій завершено! Переміг ${bot.name}!';
      }

      ref.read(battleLogProvider.notifier).addInfoLog(gameOverMessage);

      disableBotMode();
    }
  }
}
