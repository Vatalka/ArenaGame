// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BotNotifier)
final botProvider = BotNotifierProvider._();

final class BotNotifierProvider
    extends $NotifierProvider<BotNotifier, Character> {
  BotNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'botProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$botNotifierHash();

  @$internal
  @override
  BotNotifier create() => BotNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Character value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Character>(value),
    );
  }
}

String _$botNotifierHash() => r'1a9b256735d5648a62af0dd19b739fe2ea2a1f82';

abstract class _$BotNotifier extends $Notifier<Character> {
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
