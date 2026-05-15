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
        isAutoDispose: false,
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

String _$characterNotifierHash() => r'a62b42df1c5411d655c7a30e15a3e33c97db2298';

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
