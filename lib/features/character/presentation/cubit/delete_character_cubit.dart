import 'package:flutter_bloc/flutter_bloc.dart';
import 'delete_character_state.dart';

class DeleteCharacterCubit extends Cubit<DeleteCharacterState> {
  DeleteCharacterCubit() : super(const DeleteCharacterInitial());

  Future<void> delete({
    required String id,
    required Future<void> Function(String) onDeleteAction,
  }) async {
    emit(const DeleteCharacterLoading());
    try {
      await onDeleteAction(id);
      emit(const DeleteCharacterSuccess());
    } catch (e) {
      emit(DeleteCharacterError(e.toString()));
    }
  }
}
