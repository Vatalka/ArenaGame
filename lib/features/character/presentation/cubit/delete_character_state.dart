sealed class DeleteCharacterState {
  const DeleteCharacterState();
}

class DeleteCharacterInitial extends DeleteCharacterState {
  const DeleteCharacterInitial();
}

class DeleteCharacterLoading extends DeleteCharacterState {
  const DeleteCharacterLoading();
}

class DeleteCharacterSuccess extends DeleteCharacterState {
  const DeleteCharacterSuccess();
}

class DeleteCharacterError extends DeleteCharacterState {
  final String message;

  const DeleteCharacterError(this.message);
}
