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
    extends $NotifierProvider<CreationNotifier, Creation> {
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
  Override overrideWithValue(Creation value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Creation>(value),
    );
  }
}

String _$creationNotifierHash() => r'c6293ca1d9d053fa5720ab4f053bc2bd8dbd623f';

abstract class _$CreationNotifier extends $Notifier<Creation> {
  Creation build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Creation, Creation>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Creation, Creation>,
              Creation,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
