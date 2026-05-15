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
    r'aa41082ed82be5bbd3a2045ce2b236facb6df06f';

@ProviderFor(activeCharacter)
final activeCharacterProvider = ActiveCharacterProvider._();

final class ActiveCharacterProvider
    extends $FunctionalProvider<Character?, Character?, Character?>
    with $Provider<Character?> {
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
  $ProviderElement<Character?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Character? create(Ref ref) {
    return activeCharacter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Character? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Character?>(value),
    );
  }
}

String _$activeCharacterHash() => r'd195cdc6752903dc82d927524550ec3aa8172c9e';
