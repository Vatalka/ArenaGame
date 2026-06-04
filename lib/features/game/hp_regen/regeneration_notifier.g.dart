// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regeneration_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Regeneration)
final regenerationProvider = RegenerationProvider._();

final class RegenerationProvider
    extends $NotifierProvider<Regeneration, dynamic> {
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
  Override overrideWithValue(dynamic value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<dynamic>(value),
    );
  }
}

String _$regenerationHash() => r'04d2d4ddad6769047b6e3c366e5f72438eb263f2';

abstract class _$Regeneration extends $Notifier<dynamic> {
  dynamic build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<dynamic, dynamic>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<dynamic, dynamic>,
              dynamic,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
