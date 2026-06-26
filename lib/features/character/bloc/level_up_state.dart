import 'package:arena_game/features/character/domain/entities/character.dart';

class LevelUpState {
  final Character character;
  final int availablePoints;
  final int addedStrength;
  final int addedVitality;
  final bool isSaving;
  final bool saveSuccess;

  LevelUpState({
    required this.character,
    required this.availablePoints,
    this.addedStrength = 0,
    this.addedVitality = 0,
    this.isSaving = false,
    this.saveSuccess = false,
  });

  LevelUpState copyWith({
    Character? character,
    int? availablePoints,
    int? addedStrength,
    int? addedVitality,
    bool? isSaving,
    bool? saveSuccess,
  }) {
    return LevelUpState(
      character: character ?? this.character,
      availablePoints: availablePoints ?? this.availablePoints,
      addedStrength: addedStrength ?? this.addedStrength,
      addedVitality: addedVitality ?? this.addedVitality,
      isSaving: isSaving ?? this.isSaving,
      saveSuccess: saveSuccess ?? this.saveSuccess,
    );
  }
}
