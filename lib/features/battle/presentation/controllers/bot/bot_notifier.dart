import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bot_notifier.g.dart';

@Riverpod(keepAlive: true)
class BotNotifier extends _$BotNotifier {
  @override
  Character build() => Character.createDefault();
}
