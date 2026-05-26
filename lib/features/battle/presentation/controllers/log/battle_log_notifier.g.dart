// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_log_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BattleLogNotifier)
final battleLogProvider = BattleLogNotifierProvider._();

final class BattleLogNotifierProvider
    extends $NotifierProvider<BattleLogNotifier, List<BattleLogItem>> {
  BattleLogNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'battleLogProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$battleLogNotifierHash();

  @$internal
  @override
  BattleLogNotifier create() => BattleLogNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<BattleLogItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<BattleLogItem>>(value),
    );
  }
}

String _$battleLogNotifierHash() => r'918a653dfc5a8d0892ca8893868109ec5dcac2d2';

abstract class _$BattleLogNotifier extends $Notifier<List<BattleLogItem>> {
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
