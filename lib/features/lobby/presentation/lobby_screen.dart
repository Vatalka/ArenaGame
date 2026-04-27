import 'package:arena_game/features/battle/presentation/battle_screen.dart';
import 'package:flutter/material.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lobby'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Lobby Screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const BattleScreen(),
                  ),
                );
              },
              child: const Text('to Battle'),
            )
          ],
        ),
      ),
    );
  }
}
