import 'package:arena_game/features/auth/auth_repository_provider.dart';
import 'package:arena_game/features/character/domain/repositories/i_character_repository.dart';
import 'package:arena_game/features/battle/presentation/controllers/regeneration_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(regenerationProvider);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        await SystemNavigator.pop();
      },
      child: Scaffold(
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
      ),
    );
  }
}
