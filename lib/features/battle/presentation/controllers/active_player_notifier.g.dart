// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_player_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(activePlayerNotifier)
final activePlayerProvider = ActivePlayerNotifierProvider._();

final class ActivePlayerNotifierProvider
    extends $FunctionalProvider<Character, Character, Character>
    with $Provider<Character> {
  ActivePlayerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activePlayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activePlayerNotifierHash();

  @$internal
  @override
  $ProviderElement<Character> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Character create(Ref ref) {
    return activePlayerNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Character value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Character>(value),
    );
  }
}

String _$activePlayerNotifierHash() =>
    r'fd49784cef523cc82e1eff4ff685153b9476ca3e';
