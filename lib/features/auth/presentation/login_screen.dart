import 'package:arena_game/features/character/domain/repositories/character_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = Modular.get<CharacterService>();
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Modular.to.navigate('game');
            if (kDebugMode) {
              print(service.hashCode);
            }
          },
          child: Text('Navigate to Game Screen'),
        ),
      ),
    );
  }
}
