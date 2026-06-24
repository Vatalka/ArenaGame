// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_character_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(saveCharacterUseCase)
final saveCharacterUseCaseProvider = SaveCharacterUseCaseProvider._();

final class SaveCharacterUseCaseProvider
    extends
        $FunctionalProvider<
          SaveCharacterUseCase,
          SaveCharacterUseCase,
          SaveCharacterUseCase
        >
    with $Provider<SaveCharacterUseCase> {
  SaveCharacterUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saveCharacterUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saveCharacterUseCaseHash();

  @$internal
  @override
  $ProviderElement<SaveCharacterUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SaveCharacterUseCase create(Ref ref) {
    return saveCharacterUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveCharacterUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveCharacterUseCase>(value),
    );
  }
}

String _$saveCharacterUseCaseHash() =>
    r'bff668205cd9f1a1c0b7d7adcf1944e08004cf3d';
