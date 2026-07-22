import 'package:arena_game/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:arena_game/features/chat/domain/entities/chat_message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'i_chat_repository.g.dart';

abstract interface class IChatRepository {
  Stream<List<ChatMessage>> watchMessages({int limit = 50});

  Future<void> sendMessage({
    required String senderId,
    required String senderName,
    required String text,
  });
}

@riverpod
IChatRepository chatRepository(Ref ref) {
  return ChatRepositoryImpl();
}
