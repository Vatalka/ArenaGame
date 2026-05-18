import 'package:firebase_auth/firebase_auth.dart';

abstract interface class IAuthRepository {
  Stream<User?> get authStateChanges;

  Future<UserCredential> signInAnonymously();

  void signOut();
}
