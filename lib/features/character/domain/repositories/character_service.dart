import '../character.dart';

class CharacterService {
  Character getHero() {
    const initVitality = 5;

    return Character(
      name: 'Player',
      vitality: initVitality,
      strength: 5,
      precision: 5,
      agility: 5,
      currentHp: initVitality * 10,
      maxHp: initVitality * 10,
    );
  }
}
