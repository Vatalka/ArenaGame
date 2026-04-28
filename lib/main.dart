import 'package:arena_game/features/auth/presentation/login_screen.dart';
import 'package:arena_game/features/auth/presentation/game_screen.dart';
import 'package:arena_game/features/character/domain/repositories/character_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: MyApp()));
}

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(CharacterService.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => LoginScreen());
    r.child('/game', child: (context) => GameScreen());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Arena game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
