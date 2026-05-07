import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/features/auth/presentation/login_screen.dart';
import 'package:arena_game/features/home/presentation/game_screen.dart';
import 'package:arena_game/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    if (kDebugMode) {
      print("Помилка ініціалізації Firebase: $e");
    }
  }

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
  void binds(i) {}

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
