// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreationController)
final creationControllerProvider = CreationControllerProvider._();

final class CreationControllerProvider
    extends $NotifierProvider<CreationController, Character> {
  CreationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'creationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$creationControllerHash();

  @$internal
  @override
  CreationController create() => CreationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Character value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Character>(value),
    );
  }
}

String _$creationControllerHash() =>
    r'60f33292135efa10bf7676979ef2605f3d2210ef';

abstract class _$CreationController extends $Notifier<Character> {
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
