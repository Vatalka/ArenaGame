import 'package:arena_game/features/character/domain/repositories/character_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final characterService = Modular.get<CharacterRepository>();

    final character = characterService.getHero();

    return Scaffold(
      appBar: AppBar(title: Text('Game Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(character.name),
            Text('HP: ${character.currentHp} / ${character.maxHp}'),
            ElevatedButton(
              onPressed: () => Modular.to.navigate('/'),
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
