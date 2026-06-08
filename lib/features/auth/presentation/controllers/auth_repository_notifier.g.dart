// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRepositoryNotifier)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends
        $FunctionalProvider<IAuthRepository, IAuthRepository, IAuthRepository>
    with $Provider<IAuthRepository> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<IAuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IAuthRepository create(Ref ref) {
    return authRepositoryNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'5690097f4ef1050185aa12adccdd119b843ac42e';

@ProviderFor(authStateNotifier)
final authStateProvider = AuthStateProvider._();

final class AuthStateProvider
    extends $FunctionalProvider<AsyncValue<User?>, User?, Stream<User?>>
    with $FutureModifier<User?>, $StreamProvider<User?> {
  AuthStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateHash();

  @$internal
  @override
  $StreamProviderElement<User?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<User?> create(Ref ref) {
    return authStateNotifier(ref);
  }
}

String _$authStateHash() => r'c88cb36d6c93a5c7df685b2918f2d0f0710965a0';
