import 'package:arena_game/features/character/data/repositories/character_repository_impl.dart';
import 'package:arena_game/features/character/domain/repositories/character_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_provider.g.dart';

@Riverpod(keepAlive: true)
CharacterRepository characterRepository(Ref ref) {
  return CharacterRepositoryImpl();
}
