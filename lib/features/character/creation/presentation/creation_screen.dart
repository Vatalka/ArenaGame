import 'package:arena_game/features/character/creation/presentation/controller/creation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreationScreen extends ConsumerWidget {
  const CreationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(creationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Enter character name'), // тут буде TextField()
                Text('Remaining points: 5'),
              ],
            ),
            // StatSelectorRow('vitality'),
            // StatSelectorRow('strength'),
            ElevatedButton(
              onPressed: (state.remainingPoints == 0 && state.name != '')
                  ? () => Modular.to.navigate('game')
                  : null,
              child: const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}
