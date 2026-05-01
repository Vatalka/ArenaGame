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
  Area? get selectedAttack => throw _privateConstructorUsedError;
  Area? get selectedBlock => throw _privateConstructorUsedError;

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
  $Res call({Area? selectedAttack, Area? selectedBlock});
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
    Object? selectedAttack = freezed,
    Object? selectedBlock = freezed,
  }) {
    return _then(_value.copyWith(
      selectedAttack: freezed == selectedAttack
          ? _value.selectedAttack
          : selectedAttack // ignore: cast_nullable_to_non_nullable
              as Area?,
      selectedBlock: freezed == selectedBlock
          ? _value.selectedBlock
          : selectedBlock // ignore: cast_nullable_to_non_nullable
              as Area?,
    ) as $Val);
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
  $Res call({Area? selectedAttack, Area? selectedBlock});
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
    Object? selectedAttack = freezed,
    Object? selectedBlock = freezed,
  }) {
    return _then(_$BattleStateImpl(
      selectedAttack: freezed == selectedAttack
          ? _value.selectedAttack
          : selectedAttack // ignore: cast_nullable_to_non_nullable
              as Area?,
      selectedBlock: freezed == selectedBlock
          ? _value.selectedBlock
          : selectedBlock // ignore: cast_nullable_to_non_nullable
              as Area?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BattleStateImpl implements _BattleState {
  const _$BattleStateImpl({this.selectedAttack, this.selectedBlock});

  factory _$BattleStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$BattleStateImplFromJson(json);

  @override
  final Area? selectedAttack;
  @override
  final Area? selectedBlock;

  @override
  String toString() {
    return 'BattleState(selectedAttack: $selectedAttack, selectedBlock: $selectedBlock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleStateImpl &&
            (identical(other.selectedAttack, selectedAttack) ||
                other.selectedAttack == selectedAttack) &&
            (identical(other.selectedBlock, selectedBlock) ||
                other.selectedBlock == selectedBlock));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, selectedAttack, selectedBlock);

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
      {final Area? selectedAttack,
      final Area? selectedBlock}) = _$BattleStateImpl;

  factory _BattleState.fromJson(Map<String, dynamic> json) =
      _$BattleStateImpl.fromJson;

  @override
  Area? get selectedAttack;
  @override
  Area? get selectedBlock;
  @override
  @JsonKey(ignore: true)
  _$$BattleStateImplCopyWith<_$BattleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
