import 'package:arena_game/features/auth/data/auth_repository_impl.dart';
import 'package:arena_game/features/auth/domain/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_notifier.g.dart';

@riverpod
IAuthRepository authRepositoryNotifier(Ref ref) {
  return AuthRepositoryImpl();
}

@riverpod
Stream<User?> authStateNotifier(Ref ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
}
