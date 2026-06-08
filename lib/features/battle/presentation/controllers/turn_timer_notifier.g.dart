// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turn_timer_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TurnTimerNotifier)
final turnTimerProvider = TurnTimerNotifierProvider._();

final class TurnTimerNotifierProvider
    extends $NotifierProvider<TurnTimerNotifier, int> {
  TurnTimerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'turnTimerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$turnTimerNotifierHash();

  @$internal
  @override
  TurnTimerNotifier create() => TurnTimerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$turnTimerNotifierHash() => r'e13560dcab423959b1d938a4ba921dbeaa7ee499';

abstract class _$TurnTimerNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
