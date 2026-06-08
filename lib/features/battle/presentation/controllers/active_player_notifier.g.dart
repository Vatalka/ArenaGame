// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_player_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(activePlayerNotifier)
final activePlayerProvider = ActivePlayerProvider._();

final class ActivePlayerProvider
    extends $FunctionalProvider<Character, Character, Character>
    with $Provider<Character> {
  ActivePlayerProvider._()
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
  String debugGetCreateSourceHash() => _$activePlayerHash();

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

String _$activePlayerHash() => r'fbda78070690218aa08e5a1494e9196cabb1c896';
