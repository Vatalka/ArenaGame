// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectionController)
final selectionControllerProvider = SelectionControllerProvider._();

final class SelectionControllerProvider
    extends $AsyncNotifierProvider<SelectionController, List<Character>> {
  SelectionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectionControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectionControllerHash();

  @$internal
  @override
  SelectionController create() => SelectionController();
}

String _$selectionControllerHash() =>
    r'b6e5e6644546a91617627751ed3b23d64fdbec79';

abstract class _$SelectionController extends $AsyncNotifier<List<Character>> {
  FutureOr<List<Character>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Character>>, List<Character>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Character>>, List<Character>>,
              AsyncValue<List<Character>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
