// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_log_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BattleLogController)
final battleLogControllerProvider = BattleLogControllerProvider._();

final class BattleLogControllerProvider
    extends $NotifierProvider<BattleLogController, List<BattleLogItem>> {
  BattleLogControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'battleLogControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$battleLogControllerHash();

  @$internal
  @override
  BattleLogController create() => BattleLogController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<BattleLogItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<BattleLogItem>>(value),
    );
  }
}

String _$battleLogControllerHash() =>
    r'96943deee153d649315220fe474219e02ff9e9d0';

abstract class _$BattleLogController extends $Notifier<List<BattleLogItem>> {
  List<BattleLogItem> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<BattleLogItem>, List<BattleLogItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<BattleLogItem>, List<BattleLogItem>>,
              List<BattleLogItem>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
