// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creation_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreationNotifier)
final creationProvider = CreationNotifierProvider._();

final class CreationNotifierProvider
    extends $NotifierProvider<CreationNotifier, Character> {
  CreationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'creationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$creationNotifierHash();

  @$internal
  @override
  CreationNotifier create() => CreationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Character value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Character>(value),
    );
  }
}

String _$creationNotifierHash() => r'61198003742dd42edc67dab0e83a6399535a4127';

abstract class _$CreationNotifier extends $Notifier<Character> {
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
