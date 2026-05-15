import 'package:arena_game/features/character/presentation/controller/character_notifier.dart';
import 'package:arena_game/features/character_creation/presentation/controller/creation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreationScreen extends ConsumerWidget {
  const CreationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(creationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Creation Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                onChanged: (value) =>
                    ref.read(creationProvider.notifier).updateName(value),
                decoration: InputDecoration(
                  labelText: 'Enter character name',
                  filled: true,
                  fillColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerLowest,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  errorText: state.nameError,
                ),
                maxLength: 15,
              ),
            ),
            ElevatedButton(
              onPressed: state.isValid
                  ? () {
                      ref
                          .read(characterProvider.notifier)
                          .saveCreatedCharacter();
                      Future.delayed(const Duration(seconds: 2));
                      Modular.to.navigate('game');
                    }
                  : null,
              child: const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}
