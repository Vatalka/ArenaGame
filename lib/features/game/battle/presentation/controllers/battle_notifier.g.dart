// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BattleNotifier)
final battleProvider = BattleNotifierProvider._();

final class BattleNotifierProvider
    extends $NotifierProvider<BattleNotifier, BattleSelection> {
  BattleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'battleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$battleNotifierHash();

  @$internal
  @override
  BattleNotifier create() => BattleNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BattleSelection value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BattleSelection>(value),
    );
  }
}

String _$battleNotifierHash() => r'8b4b9e3e354cc9fa421e52c171480acb2d2248a4';

abstract class _$BattleNotifier extends $Notifier<BattleSelection> {
  BattleSelection build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<BattleSelection, BattleSelection>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BattleSelection, BattleSelection>,
              BattleSelection,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
