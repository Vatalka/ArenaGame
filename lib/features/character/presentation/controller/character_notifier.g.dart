// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CharacterNotifier)
final characterProvider = CharacterNotifierFamily._();

final class CharacterNotifierProvider
    extends $NotifierProvider<CharacterNotifier, Character> {
  CharacterNotifierProvider._({
    required CharacterNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'characterProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$characterNotifierHash();

  @override
  String toString() {
    return r'characterProvider'
        ''
        '($argument)';
  }

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

  @override
  bool operator ==(Object other) {
    return other is CharacterNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$characterNotifierHash() => r'f8c6d803e89210d13c123fe0e029372d7a59698e';

final class CharacterNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CharacterNotifier,
          Character,
          Character,
          Character,
          String
        > {
  CharacterNotifierFamily._()
    : super(
        retry: null,
        name: r'characterProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CharacterNotifierProvider call(String characterName) =>
      CharacterNotifierProvider._(argument: characterName, from: this);

  @override
  String toString() => r'characterProvider';
}

abstract class _$CharacterNotifier extends $Notifier<Character> {
  late final _$args = ref.$arg as String;
  String get characterName => _$args;

  Character build(String characterName);
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
    element.handleCreate(ref, () => build(_$args));
  }
}
