// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'i_character_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(characterRepository)
final characterRepositoryProvider = CharacterRepositoryProvider._();

final class CharacterRepositoryProvider
    extends
        $FunctionalProvider<
          ICharacterRepository,
          ICharacterRepository,
          ICharacterRepository
        >
    with $Provider<ICharacterRepository> {
  CharacterRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'characterRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$characterRepositoryHash();

  @$internal
  @override
  $ProviderElement<ICharacterRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ICharacterRepository create(Ref ref) {
    return characterRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ICharacterRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ICharacterRepository>(value),
    );
  }
}

String _$characterRepositoryHash() =>
    r'83393d6d772896f641b6f9d8a831d955cad5adb2';

@ProviderFor(activeCharacter)
final activeCharacterProvider = ActiveCharacterProvider._();

final class ActiveCharacterProvider
    extends
        $FunctionalProvider<
          AsyncValue<Character?>,
          Character?,
          FutureOr<Character?>
        >
    with $FutureModifier<Character?>, $FutureProvider<Character?> {
  ActiveCharacterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeCharacterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeCharacterHash();

  @$internal
  @override
  $FutureProviderElement<Character?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Character?> create(Ref ref) {
    return activeCharacter(ref);
  }
}

String _$activeCharacterHash() => r'2338c3b3718996c27e4b6046ab30d458d3d8843b';

@ProviderFor(allCharacters)
final allCharactersProvider = AllCharactersProvider._();

final class AllCharactersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Character>>,
          List<Character>,
          FutureOr<List<Character>>
        >
    with $FutureModifier<List<Character>>, $FutureProvider<List<Character>> {
  AllCharactersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allCharactersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allCharactersHash();

  @$internal
  @override
  $FutureProviderElement<List<Character>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Character>> create(Ref ref) {
    return allCharacters(ref);
  }
}

String _$allCharactersHash() => r'12cf163da6a74c3f8cedcf1907fac77cf2e98b12';
