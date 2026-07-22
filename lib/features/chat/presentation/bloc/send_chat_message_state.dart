sealed class SendChatMessageState {
  const SendChatMessageState();
}

class SendChatMessageInitial extends SendChatMessageState {
  const SendChatMessageInitial();
}

class SendChatMessageLoading extends SendChatMessageState {
  const SendChatMessageLoading();
}

class SendChatMessageSuccess extends SendChatMessageState {
  const SendChatMessageSuccess();
}

class SendChatMessageError extends SendChatMessageState {
  final String message;

  const SendChatMessageError(this.message);
}
