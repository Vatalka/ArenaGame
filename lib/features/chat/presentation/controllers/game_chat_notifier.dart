import 'package:arena_game/features/chat/domain/entities/chat_message.dart';
import 'package:arena_game/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_chat_notifier.g.dart';

@riverpod
Stream<List<ChatMessage>> gameChatMessagesNotifier(Ref ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return repository.watchMessages();
}
