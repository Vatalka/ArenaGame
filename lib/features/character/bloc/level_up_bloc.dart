import 'package:arena_game/features/character/bloc/level_up_event.dart';
import 'package:arena_game/features/character/bloc/level_up_state.dart';
import 'package:arena_game/features/character/domain/entities/character.dart';
import 'package:arena_game/features/character/domain/usecases/save_character_use_case.dart';
import 'package:bloc/bloc.dart';

class LevelUpBloc extends Bloc<LevelUpEvent, LevelUpState> {
  final SaveCharacterUseCase _saveCharacterUseCase;

  LevelUpBloc({
    required Character initialCharacter,
    required SaveCharacterUseCase saveCharacterUseCase,
  }) : _saveCharacterUseCase = saveCharacterUseCase,
       super(
         LevelUpState(
           character: initialCharacter,
           availablePoints: initialCharacter.statPoints,
         ),
       ) {
    on<IncreaseStatEvent>(_onIncreaseStat);
    on<DecreaseStatEvent>(_onDecreaseStat);
    on<ConfirmUpgradeEvent>(_onConfirmUpgrade);
  }

  void _onIncreaseStat(IncreaseStatEvent event, Emitter<LevelUpState> emit) {
    if (state.availablePoints <= 0) return;

    if (event.statType == StatType.strength) {
      emit(
        state.copyWith(
          availablePoints: state.availablePoints - 1,
          addedStrength: state.addedStrength + 1,
        ),
      );
    } else if (event.statType == StatType.vitality) {
      emit(
        state.copyWith(
          availablePoints: state.availablePoints - 1,
          addedVitality: state.addedVitality + 1,
        ),
      );
    }
  }

  void _onDecreaseStat(DecreaseStatEvent event, Emitter<LevelUpState> emit) {
    if (event.statType == StatType.strength && state.addedStrength > 0) {
      emit(
        state.copyWith(
          availablePoints: state.availablePoints + 1,
          addedStrength: state.addedStrength - 1,
        ),
      );
    } else if (event.statType == StatType.vitality && state.addedVitality > 0) {
      emit(
        state.copyWith(
          availablePoints: state.availablePoints + 1,
          addedVitality: state.addedVitality - 1,
        ),
      );
    }
  }

  void _onConfirmUpgrade(
    ConfirmUpgradeEvent event,
    Emitter<LevelUpState> emit,
  ) async {
    emit(state.copyWith(isSaving: true));

    final updatedCharacter = state.character.copyWith(
      statPoints: state.availablePoints,
      strength: state.character.strength + state.addedStrength,
      vitality: state.character.vitality + state.addedVitality,
      currentHp: state.character.maxHp,
    );

    await _saveCharacterUseCase(updatedCharacter);

    emit(state.copyWith(isSaving: false, character: updatedCharacter));

    // тут можна додати подію успіху щоб закрити екран
  }
}
