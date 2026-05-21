// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CharacterNotifier)
final characterProvider = CharacterNotifierProvider._();

final class CharacterNotifierProvider
    extends $NotifierProvider<CharacterNotifier, Character> {
  CharacterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'characterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$characterNotifierHash();

  @$internal
  @override
  CharacterNotifier create() => CharacterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Character value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Character>(value),
    );
  }
}

String _$characterNotifierHash() => r'a5f07355d0804edc31de76a41383a2b4d3992d81';

abstract class _$CharacterNotifier extends $Notifier<Character> {
  Character build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Character, Character>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Character, Character>,
              Character,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AllCharacters)
final allCharactersProvider = AllCharactersProvider._();

final class AllCharactersProvider
    extends $AsyncNotifierProvider<AllCharacters, List<Character>> {
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
  AllCharacters create() => AllCharacters();
}

String _$allCharactersHash() => r'86fcdaca1a00a53e4e2f6a724da216c70ff752e5';

abstract class _$AllCharacters extends $AsyncNotifier<List<Character>> {
  FutureOr<List<Character>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Character>>, List<Character>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Character>>, List<Character>>,
              AsyncValue<List<Character>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
