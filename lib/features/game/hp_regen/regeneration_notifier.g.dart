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

String _$regenerationHash() => r'bbcd61bf7b5826341c1bbe45694d973b722d1f97';

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
