import 'package:arena_game/features/character/presentation/character_screen.dart';
import 'package:flutter/material.dart';

class BattleScreen extends StatelessWidget {
  const BattleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battle'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Battle Screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CharacterScreen(),
                  ),
                );
              },
              child: const Text('to Character'),
            )
          ],
        ),
      ),
    );
  }
}
