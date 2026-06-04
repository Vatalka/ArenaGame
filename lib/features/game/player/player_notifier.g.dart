// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlayerNotifier)
final playerProvider = PlayerNotifierProvider._();

final class PlayerNotifierProvider
    extends $NotifierProvider<PlayerNotifier, Character> {
  PlayerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerNotifierHash();

  @$internal
  @override
  PlayerNotifier create() => PlayerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Character value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Character>(value),
    );
  }
}

String _$playerNotifierHash() => r'946f8b48f1055f39b7c17ff0eb7458dc219f96cc';

abstract class _$PlayerNotifier extends $Notifier<Character> {
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
