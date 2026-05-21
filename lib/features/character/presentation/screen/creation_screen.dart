import 'package:arena_game/features/character/presentation/controller/creation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreationScreen extends ConsumerStatefulWidget {
  const CreationScreen({super.key});

  @override
  ConsumerState<CreationScreen> createState() => _CreationScreenState();
}

class _CreationScreenState extends ConsumerState<CreationScreen> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(creationControllerProvider.notifier);
    final state = ref.watch(creationControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Creation Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                controller: _nameController,
                onChanged: (value) => controller.updateName(value),
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
                  ? () async {
                      await controller.createAndSave();
                      Modular.to.navigate('/selection');
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
