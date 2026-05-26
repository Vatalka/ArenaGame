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

  void selectAttack(Area? area) {
    state = state.copyWith(selectedAttack: area);
  }

  void selectBlock(Area? area) {
    state = state.copyWith(selectedBlock: area);
  }

  void confirmTurn() {
    final player = ref.watch(playerProvider);
    final bot = ref.watch(botProvider);

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
  }

  Area _getRandomArea() {
    final areas = Area.values;
    final randomIndex = _random.nextInt(areas.length);
    return areas[randomIndex];
  }
}
