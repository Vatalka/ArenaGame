import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'auth/data/auth_repository.dart';
import 'character/domain/repositories/i_character_repository.dart';

part 'app_startup.g.dart';

@riverpod
Future<String> initialLocation(Ref ref) async {
  final authState = ref.watch(authStateProvider);
  if (authState.isLoading) return '/';

  final user = authState.value;
  if (user == null) {
    return '/login';
  }

  try {
    final characterRepo = ref.watch(characterRepositoryProvider);
    final character = await characterRepo.getCharacter();

    return character == null ? '/creation' : '/game';
  } catch (e) {
    return '/login';
  }
}
