import 'package:arena_game/features/character/presentation/controllers/creation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreationScreen extends ConsumerWidget {
  const CreationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterState = ref.watch(creationControllerProvider);
    final creationController = ref.read(creationControllerProvider.notifier);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        Modular.to.navigate('/');
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Creation'),
          leading: IconButton(
            onPressed: () => Modular.to.navigate('/'),
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  onChanged: (value) => creationController.updateName(value),
                  decoration: InputDecoration(
                    labelText: 'Enter Character name',
                    filled: true,
                    fillColor: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerLowest,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorText: characterState.nameError,
                  ),
                  maxLength: 15,
                ),
              ),
              ElevatedButton(
                onPressed: characterState.nameIsValid
                    ? () async {
                        await creationController.createAndSave();
                        Modular.to.navigate('/selection');
                      }
                    : null,
                child: const Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
