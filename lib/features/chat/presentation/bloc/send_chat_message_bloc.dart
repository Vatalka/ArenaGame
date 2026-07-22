import 'package:arena_game/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:arena_game/features/chat/presentation/bloc/send_chat_message_event.dart';
import 'package:arena_game/features/chat/presentation/bloc/send_chat_message_state.dart';
import 'package:bloc/bloc.dart';

class SendChatMessageBloc
    extends Bloc<SendChatMessageEvent, SendChatMessageState> {
  final IChatRepository _chatRepository;

  SendChatMessageBloc({required IChatRepository chatRepository})
    : _chatRepository = chatRepository,
      super(const SendChatMessageInitial()) {
    on<ChatMessageSubmitted>(_onMessageSubmitted);
  }

  Future<void> _onMessageSubmitted(
    ChatMessageSubmitted event,
    Emitter<SendChatMessageState> emit,
  ) async {
    if (event.text.trim().isEmpty) return;

    emit(const SendChatMessageLoading());
    try {
      await _chatRepository.sendMessage(
        senderId: event.senderId,
        senderName: event.senderName,
        text: event.text,
      );
      emit(const SendChatMessageSuccess());
    } catch (e) {
      emit(SendChatMessageError(e.toString()));
    }
  }
}
