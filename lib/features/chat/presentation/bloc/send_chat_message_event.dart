abstract class SendChatMessageEvent {}

class ChatMessageSubmitted extends SendChatMessageEvent {
  final String senderId;
  final String senderName;
  final String text;

  ChatMessageSubmitted({
    required this.senderId,
    required this.senderName,
    required this.text,
  });
}
