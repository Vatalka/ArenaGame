import '../entities/character.dart';

class CharacterRepository {
  Character getHero() {
    return Character.createDefault('Player');

    // На майбутнє: якщо дані будуть з мережі/БД
    //Future<Character> loadHeroFromStorage() async {
    // Припустимо, ми завантажили тільки сирі цифри
    // { "name": "Warrior", "vitality": 10, "currentHp": 85 }
    //final json = await _someApi.fetchData();
    //return Character.fromJson(json);
    // Тут maxHp все одно підтягнеться через геттер автоматично!
  }
}
