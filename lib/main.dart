import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/features/auth/presentation/login_screen.dart';
import 'package:arena_game/features/character/data/repositories/character_repository.dart';
import 'package:arena_game/features/home/presentation/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/character/domain/repositories/character_repository.dart';

void main() {
  runApp(
    ProviderScope(
      child: ModularApp(
        module: AppModule(),
        child: MyApp(),
      ),
    ),
  );
}

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<CharacterRepository>(CharacterRepositoryImpl.new);
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
          extensions: [
            GameColors(
              healthHigh: Colors.green,
              healthMedium: Colors.yellow,
              healthLow: Colors.red,
            ),
          ]),
      routerConfig: Modular.routerConfig,
    );
  }
}
