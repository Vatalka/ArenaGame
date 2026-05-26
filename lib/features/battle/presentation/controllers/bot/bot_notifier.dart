import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bot_notifier.g.dart';

@riverpod
class BotNotifier extends _$BotNotifier {
  @override
  Character build() => Character.createDefault().copyWith(name: 'Бот Залізяка');

  void takeDamage(int amount) {
    state = state.copyWith(
      currentHp: (state.currentHp - amount).clamp(0, state.maxHp),
    );
  }
}
