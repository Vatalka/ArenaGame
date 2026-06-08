// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regeneration_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Regeneration)
final regenerationProvider = RegenerationProvider._();

final class RegenerationProvider extends $NotifierProvider<Regeneration, void> {
  RegenerationProvider._()
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
  String debugGetCreateSourceHash() => _$regenerationHash();

  @$internal
  @override
  Regeneration create() => Regeneration();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$regenerationHash() => r'90c97c081113909ad85d8d05d01f7464487746ed';

abstract class _$Regeneration extends $Notifier<void> {
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
