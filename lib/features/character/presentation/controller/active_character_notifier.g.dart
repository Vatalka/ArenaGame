// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_character_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ActiveCharacterNotifier)
final activeCharacterProvider = ActiveCharacterNotifierProvider._();

final class ActiveCharacterNotifierProvider
    extends $NotifierProvider<ActiveCharacterNotifier, Character?> {
  ActiveCharacterNotifierProvider._()
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
  String debugGetCreateSourceHash() => _$activeCharacterNotifierHash();

  @$internal
  @override
  ActiveCharacterNotifier create() => ActiveCharacterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Character? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Character?>(value),
    );
  }
}

String _$activeCharacterNotifierHash() =>
    r'e669844b9bced64fa7795830204c8e5b869e9a75';

abstract class _$ActiveCharacterNotifier extends $Notifier<Character?> {
  Character? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Character?, Character?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Character?, Character?>,
              Character?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
