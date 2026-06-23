import 'package:arena_game/features/character/domain/entities/character.dart';

class LevelUpState {
  final Character character;
  final int availablePoints;
  final int addedStrength;
  final int addedVitality;
  final bool isSaving;

  LevelUpState({
    required this.character,
    required this.availablePoints,
    this.addedStrength = 0,
    this.addedVitality = 0,
    this.isSaving = false,
  });

  // LevelUpState copyWith({}) {}
}
