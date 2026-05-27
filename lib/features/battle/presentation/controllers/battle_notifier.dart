import 'dart:math';
import 'package:arena_game/features/battle/domain/entities/battle_selection.dart';
import 'package:arena_game/features/battle/domain/entities/log/battle_log_item.dart';
import 'package:arena_game/features/battle/presentation/controllers/bot/bot_notifier.dart';
import 'package:arena_game/features/battle/presentation/controllers/log/battle_log_notifier.dart';
import 'package:arena_game/features/battle/presentation/controllers/player/player_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'battle_notifier.g.dart';

@riverpod
class BattleNotifier extends _$BattleNotifier {
  final _random = Random();

  @override
  BattleSelection build() => const BattleSelection();

  void selectAttack(Area? area) => state = state.copyWith(selectedAttack: area);

  void selectBlock(Area? area) => state = state.copyWith(selectedBlock: area);

  void enableBotMode() {
    final player = ref.read(playerProvider);
    final bot = ref.read(botProvider);
    state = state.copyWith(isBotMode: true);
    ref
        .read(battleLogProvider.notifier)
        .addLog('Почався бій між ${player.name} та ${bot.name}', LogType.info);
  }

  void disableBotMode() {
    state = state.copyWith(isBotMode: false);
  }

  void confirmTurn() {
    final player = ref.read(playerProvider);
    final bot = ref.read(botProvider);

    final playerAttackArea = state.selectedAttack;
    final playerBlockArea = state.selectedBlock;

    final botAttackArea = _getRandomArea();
    final botBlockArea = _getRandomArea();

    int damageToBot = player.strength;
    if (playerAttackArea == botBlockArea) {
      damageToBot = 0;
      ref
          .read(battleLogProvider.notifier)
          .addLog(
            '${bot.name} успішно заблокував удар у $playerAttackArea!',
            LogType.block,
          );
    } else {
      ref
          .read(battleLogProvider.notifier)
          .addLog(
            '${player.name} влупив у $playerAttackArea на $damageToBot шкоди!',
            LogType.attack,
          );
    }
    ref.read(botProvider.notifier).takeDamage(damageToBot);

    int damageToPlayer = bot.strength;
    if (botAttackArea == playerBlockArea) {
      damageToPlayer = 0;
      ref
          .read(battleLogProvider.notifier)
          .addLog(
            '${player.name} успішно заблокував удар у $botAttackArea!',
            LogType.block,
          );
    } else {
      ref
          .read(battleLogProvider.notifier)
          .addLog(
            '${bot.name} влучив у $botAttackArea на $damageToPlayer шкоди!',
            LogType.attack,
          );
    }
    ref.read(playerProvider.notifier).takeDamage(damageToPlayer);

    final updatedPlayer = ref.read(playerProvider);
    final updatedBot = ref.read(botProvider);

    final isPlayerDead = updatedPlayer.currentHp <= 0;
    final isBotDead = updatedBot.currentHp <= 0;

    if (isPlayerDead || isBotDead) {
      String battleOverMessage = '';

      if (isPlayerDead && isBotDead) {
        battleOverMessage = 'Бій завершено нічиєю! Обидва бійці непритомні.';
      } else if (isBotDead) {
        battleOverMessage =
            'Бій завершено! Переміг ${player.name}!';
      } else if (isPlayerDead) {
        battleOverMessage =
            'Бій завершено! Переміг ${bot.name}. Спробуйте ще раз!';
      }
      ref
          .read(battleLogProvider.notifier)
          .addLog(
            battleOverMessage,
            LogType.info,
          );
      disableBotMode();
    }
  }

  Area _getRandomArea() {
    final areas = Area.values;
    final randomIndex = _random.nextInt(areas.length);
    return areas[randomIndex];
  }
}
