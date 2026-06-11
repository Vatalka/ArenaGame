// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regeneration_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RegenerationNotifier)
final regenerationProvider = RegenerationNotifierProvider._();

final class RegenerationNotifierProvider
    extends $NotifierProvider<RegenerationNotifier, void> {
  RegenerationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'regenerationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$regenerationNotifierHash();

  @$internal
  @override
  RegenerationNotifier create() => RegenerationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$regenerationNotifierHash() =>
    r'336e2c10627d4abb1419a3ba4642c35e44cfcc85';

abstract class _$RegenerationNotifier extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
