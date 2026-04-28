// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BattleState _$BattleStateFromJson(Map<String, dynamic> json) {
  return _BattleState.fromJson(json);
}

/// @nodoc
mixin _$BattleState {
  Character get player => throw _privateConstructorUsedError;
  Character get enemy => throw _privateConstructorUsedError;
  BattleZone? get playerAttackZone => throw _privateConstructorUsedError;
  BattleZone? get playerBlockZone => throw _privateConstructorUsedError;
  BattleZone? get enemyAttackZone => throw _privateConstructorUsedError;
  BattleZone? get enemyBlockZone => throw _privateConstructorUsedError;
  List<String> get battleLog => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BattleStateCopyWith<BattleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleStateCopyWith<$Res> {
  factory $BattleStateCopyWith(
          BattleState value, $Res Function(BattleState) then) =
      _$BattleStateCopyWithImpl<$Res, BattleState>;
  @useResult
  $Res call(
      {Character player,
      Character enemy,
      BattleZone? playerAttackZone,
      BattleZone? playerBlockZone,
      BattleZone? enemyAttackZone,
      BattleZone? enemyBlockZone,
      List<String> battleLog});

  $CharacterCopyWith<$Res> get player;
  $CharacterCopyWith<$Res> get enemy;
}

/// @nodoc
class _$BattleStateCopyWithImpl<$Res, $Val extends BattleState>
    implements $BattleStateCopyWith<$Res> {
  _$BattleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? enemy = null,
    Object? playerAttackZone = freezed,
    Object? playerBlockZone = freezed,
    Object? enemyAttackZone = freezed,
    Object? enemyBlockZone = freezed,
    Object? battleLog = null,
  }) {
    return _then(_value.copyWith(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as Character,
      enemy: null == enemy
          ? _value.enemy
          : enemy // ignore: cast_nullable_to_non_nullable
              as Character,
      playerAttackZone: freezed == playerAttackZone
          ? _value.playerAttackZone
          : playerAttackZone // ignore: cast_nullable_to_non_nullable
              as BattleZone?,
      playerBlockZone: freezed == playerBlockZone
          ? _value.playerBlockZone
          : playerBlockZone // ignore: cast_nullable_to_non_nullable
              as BattleZone?,
      enemyAttackZone: freezed == enemyAttackZone
          ? _value.enemyAttackZone
          : enemyAttackZone // ignore: cast_nullable_to_non_nullable
              as BattleZone?,
      enemyBlockZone: freezed == enemyBlockZone
          ? _value.enemyBlockZone
          : enemyBlockZone // ignore: cast_nullable_to_non_nullable
              as BattleZone?,
      battleLog: null == battleLog
          ? _value.battleLog
          : battleLog // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<$Res> get player {
    return $CharacterCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<$Res> get enemy {
    return $CharacterCopyWith<$Res>(_value.enemy, (value) {
      return _then(_value.copyWith(enemy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BattleStateImplCopyWith<$Res>
    implements $BattleStateCopyWith<$Res> {
  factory _$$BattleStateImplCopyWith(
          _$BattleStateImpl value, $Res Function(_$BattleStateImpl) then) =
      __$$BattleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Character player,
      Character enemy,
      BattleZone? playerAttackZone,
      BattleZone? playerBlockZone,
      BattleZone? enemyAttackZone,
      BattleZone? enemyBlockZone,
      List<String> battleLog});

  @override
  $CharacterCopyWith<$Res> get player;
  @override
  $CharacterCopyWith<$Res> get enemy;
}

/// @nodoc
class __$$BattleStateImplCopyWithImpl<$Res>
    extends _$BattleStateCopyWithImpl<$Res, _$BattleStateImpl>
    implements _$$BattleStateImplCopyWith<$Res> {
  __$$BattleStateImplCopyWithImpl(
      _$BattleStateImpl _value, $Res Function(_$BattleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? enemy = null,
    Object? playerAttackZone = freezed,
    Object? playerBlockZone = freezed,
    Object? enemyAttackZone = freezed,
    Object? enemyBlockZone = freezed,
    Object? battleLog = null,
  }) {
    return _then(_$BattleStateImpl(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as Character,
      enemy: null == enemy
          ? _value.enemy
          : enemy // ignore: cast_nullable_to_non_nullable
              as Character,
      playerAttackZone: freezed == playerAttackZone
          ? _value.playerAttackZone
          : playerAttackZone // ignore: cast_nullable_to_non_nullable
              as BattleZone?,
      playerBlockZone: freezed == playerBlockZone
          ? _value.playerBlockZone
          : playerBlockZone // ignore: cast_nullable_to_non_nullable
              as BattleZone?,
      enemyAttackZone: freezed == enemyAttackZone
          ? _value.enemyAttackZone
          : enemyAttackZone // ignore: cast_nullable_to_non_nullable
              as BattleZone?,
      enemyBlockZone: freezed == enemyBlockZone
          ? _value.enemyBlockZone
          : enemyBlockZone // ignore: cast_nullable_to_non_nullable
              as BattleZone?,
      battleLog: null == battleLog
          ? _value._battleLog
          : battleLog // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BattleStateImpl implements _BattleState {
  const _$BattleStateImpl(
      {required this.player,
      required this.enemy,
      this.playerAttackZone,
      this.playerBlockZone,
      this.enemyAttackZone,
      this.enemyBlockZone,
      required final List<String> battleLog})
      : _battleLog = battleLog;

  factory _$BattleStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$BattleStateImplFromJson(json);

  @override
  final Character player;
  @override
  final Character enemy;
  @override
  final BattleZone? playerAttackZone;
  @override
  final BattleZone? playerBlockZone;
  @override
  final BattleZone? enemyAttackZone;
  @override
  final BattleZone? enemyBlockZone;
  final List<String> _battleLog;
  @override
  List<String> get battleLog {
    if (_battleLog is EqualUnmodifiableListView) return _battleLog;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_battleLog);
  }

  @override
  String toString() {
    return 'BattleState(player: $player, enemy: $enemy, playerAttackZone: $playerAttackZone, playerBlockZone: $playerBlockZone, enemyAttackZone: $enemyAttackZone, enemyBlockZone: $enemyBlockZone, battleLog: $battleLog)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleStateImpl &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.enemy, enemy) || other.enemy == enemy) &&
            (identical(other.playerAttackZone, playerAttackZone) ||
                other.playerAttackZone == playerAttackZone) &&
            (identical(other.playerBlockZone, playerBlockZone) ||
                other.playerBlockZone == playerBlockZone) &&
            (identical(other.enemyAttackZone, enemyAttackZone) ||
                other.enemyAttackZone == enemyAttackZone) &&
            (identical(other.enemyBlockZone, enemyBlockZone) ||
                other.enemyBlockZone == enemyBlockZone) &&
            const DeepCollectionEquality()
                .equals(other._battleLog, _battleLog));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      player,
      enemy,
      playerAttackZone,
      playerBlockZone,
      enemyAttackZone,
      enemyBlockZone,
      const DeepCollectionEquality().hash(_battleLog));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BattleStateImplCopyWith<_$BattleStateImpl> get copyWith =>
      __$$BattleStateImplCopyWithImpl<_$BattleStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BattleStateImplToJson(
      this,
    );
  }
}

abstract class _BattleState implements BattleState {
  const factory _BattleState(
      {required final Character player,
      required final Character enemy,
      final BattleZone? playerAttackZone,
      final BattleZone? playerBlockZone,
      final BattleZone? enemyAttackZone,
      final BattleZone? enemyBlockZone,
      required final List<String> battleLog}) = _$BattleStateImpl;

  factory _BattleState.fromJson(Map<String, dynamic> json) =
      _$BattleStateImpl.fromJson;

  @override
  Character get player;
  @override
  Character get enemy;
  @override
  BattleZone? get playerAttackZone;
  @override
  BattleZone? get playerBlockZone;
  @override
  BattleZone? get enemyAttackZone;
  @override
  BattleZone? get enemyBlockZone;
  @override
  List<String> get battleLog;
  @override
  @JsonKey(ignore: true)
  _$$BattleStateImplCopyWith<_$BattleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
