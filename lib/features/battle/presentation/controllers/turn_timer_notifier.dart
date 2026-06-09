import 'dart:async';
import 'package:arena_game/features/battle/presentation/controllers/battle_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'turn_timer_notifier.g.dart';

@riverpod
class TurnTimerNotifier extends _$TurnTimerNotifier {
  Timer? _timer;

  @override
  int build() {
    final isCombatMode = ref.watch(
      battleProvider.select((state) => state.isBotMode),
    );

    final isTurnReady = ref.watch(
      battleProvider.select((state) => state.isTurnReady),
    );

    if (isCombatMode && !isTurnReady) {
      _startTimer();
    } else {
      _stopTimer();
    }

    ref.onDispose(() => _stopTimer());

    return 10;
  }

  void _startTimer() {
    _stopTimer();
    state = 10;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 1) {
        state--;
      } else {
        _stopTimer();
        state = 0;

        ref.read(battleProvider.notifier).skipTurn();
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
