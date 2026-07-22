import 'package:arena_game/features/chat/data/models/chat_message_model.dart';
import 'package:arena_game/features/chat/domain/entities/chat_message.dart';
import 'package:arena_game/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepositoryImpl implements IChatRepository {
  static const String _chatsCollection = 'game_chats';
  static const String _globalRoomId = 'arena_lobby';
  static const String _messagesSubcollection = 'messages';
  static const int _maxTextLength = 200;

  CollectionReference<Map<String, dynamic>> get _messagesRef =>
      FirebaseFirestore.instance
          .collection(_chatsCollection)
          .doc(_globalRoomId)
          .collection(_messagesSubcollection);

  @override
  Future<void> sendMessage({
    required String senderId,
    required String senderName,
    required String text,
  }) async {
    final trimmedText = text.trim();
    if (trimmedText.isEmpty) return;

    final safeText = trimmedText.length > _maxTextLength
        ? trimmedText.substring(0, _maxTextLength)
        : trimmedText;

    final safeSenderName = senderName.trim().isEmpty
        ? 'Гравець'
        : senderName.trim();

    final model = ChatMessageModel(
      id: '',
      senderId: senderId,
      senderName: safeSenderName,
      text: safeText,
      sentAt: DateTime.now(),
    );

    await _messagesRef.add(model.toFirestoreMap());
  }

  @override
  Stream<List<ChatMessage>> watchMessages({int limit = 50}) {
    return _messagesRef
        .orderBy('sentAt', descending: true)
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => ChatMessageModel.fromDocument(doc).toEntity())
              .toList(),
        );
  }
}
