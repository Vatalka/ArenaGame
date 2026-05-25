import 'package:arena_game/core/theme/game_colors.dart';
import 'package:arena_game/features/auth/presentation/screens/login_screen.dart';
import 'package:arena_game/features/character/presentation/screens/creation_screen.dart';
import 'package:arena_game/features/home/presentation/game_screen.dart';
import 'package:arena_game/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/auth/data/auth_repository_impl.dart';
import 'features/auth/domain/i_auth_repository.dart';
import 'features/character/presentation/screens/selection_screen.dart';
import 'features/character/data/repositories/character_repository_impl.dart';
import 'features/character/domain/repositories/i_character_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

  await Hive.initFlutter();

  runApp(
    ProviderScope(
      child: ModularApp(module: AppModule(), child: MyApp()),
    ),
  );
}

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<ICharacterRepository>(CharacterRepositoryImpl.new);
    i.addLazySingleton<IAuthRepository>(AuthRepositoryImpl.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => LoginScreen());
    r.child('/creation', child: (_) => CreationScreen());
    r.child('/selection', child: (_) => SelectionScreen());
    r.child('/game', child: (_) => GameScreen());
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
        ],
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
