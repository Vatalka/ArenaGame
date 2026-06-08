import 'package:arena_game/features/auth/domain/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_notifier.g.dart';

@riverpod
IAuthRepository authRepositoryNotifier(Ref ref) {
  return Modular.get<IAuthRepository>();
}

@riverpod
Stream<User?> authStateNotifier(Ref ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
}
