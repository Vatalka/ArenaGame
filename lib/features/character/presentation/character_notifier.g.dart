// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$characterNotifierHash() => r'89328a00c8f8a9fe0618fe549a0d788971695f2c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CharacterNotifier extends BuildlessNotifier<Character> {
  late final String characterName;

  Character build(
    String characterName,
  );
}

/// See also [CharacterNotifier].
@ProviderFor(CharacterNotifier)
const characterNotifierProvider = CharacterNotifierFamily();

/// See also [CharacterNotifier].
class CharacterNotifierFamily extends Family<Character> {
  /// See also [CharacterNotifier].
  const CharacterNotifierFamily();

  /// See also [CharacterNotifier].
  CharacterNotifierProvider call(
    String characterName,
  ) {
    return CharacterNotifierProvider(
      characterName,
    );
  }

  @override
  CharacterNotifierProvider getProviderOverride(
    covariant CharacterNotifierProvider provider,
  ) {
    return call(
      provider.characterName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'characterNotifierProvider';
}

/// See also [CharacterNotifier].
class CharacterNotifierProvider
    extends NotifierProviderImpl<CharacterNotifier, Character> {
  /// See also [CharacterNotifier].
  CharacterNotifierProvider(
    String characterName,
  ) : this._internal(
          () => CharacterNotifier()..characterName = characterName,
          from: characterNotifierProvider,
          name: r'characterNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$characterNotifierHash,
          dependencies: CharacterNotifierFamily._dependencies,
          allTransitiveDependencies:
              CharacterNotifierFamily._allTransitiveDependencies,
          characterName: characterName,
        );

  CharacterNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.characterName,
  }) : super.internal();

  final String characterName;

  @override
  Character runNotifierBuild(
    covariant CharacterNotifier notifier,
  ) {
    return notifier.build(
      characterName,
    );
  }

  @override
  Override overrideWith(CharacterNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CharacterNotifierProvider._internal(
        () => create()..characterName = characterName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        characterName: characterName,
      ),
    );
  }

  @override
  NotifierProviderElement<CharacterNotifier, Character> createElement() {
    return _CharacterNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CharacterNotifierProvider &&
        other.characterName == characterName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, characterName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CharacterNotifierRef on NotifierProviderRef<Character> {
  /// The parameter `characterName` of this provider.
  String get characterName;
}

class _CharacterNotifierProviderElement
    extends NotifierProviderElement<CharacterNotifier, Character>
    with CharacterNotifierRef {
  _CharacterNotifierProviderElement(super.provider);

  @override
  String get characterName =>
      (origin as CharacterNotifierProvider).characterName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
