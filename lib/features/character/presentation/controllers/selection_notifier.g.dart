// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectionNotifier)
final selectionProvider = SelectionNotifierProvider._();

final class SelectionNotifierProvider
    extends $AsyncNotifierProvider<SelectionNotifier, List<Character>> {
  SelectionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectionNotifierHash();

  @$internal
  @override
  SelectionNotifier create() => SelectionNotifier();
}

String _$selectionNotifierHash() => r'3fbf6a5de7c01dd523259b005795d7d33049aa2d';

abstract class _$SelectionNotifier extends $AsyncNotifier<List<Character>> {
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
