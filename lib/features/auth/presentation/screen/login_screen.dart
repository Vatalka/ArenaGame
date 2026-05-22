import 'package:arena_game/features/auth/auth_repository_provider.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await ref.read(authRepositoryProvider).signInAnonymously();
            final characterRepository = ref.read(characterRepositoryProvider);
            final characters = await characterRepository.getAllCharacters();
            if (characters.isNotEmpty) {
              Modular.to.navigate('/selection');
            } else {
              Modular.to.navigate('/creation');
            }
          },
          child: const Text('Login as a Guest'),
        ),
      ),
    );
  }
}
