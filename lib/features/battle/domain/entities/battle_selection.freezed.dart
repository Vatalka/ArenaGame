// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BattleSelection _$BattleSelectionFromJson(Map<String, dynamic> json) {
  return _BattleSelection.fromJson(json);
}

/// @nodoc
mixin _$BattleSelection {
  Area? get selectedAttack => throw _privateConstructorUsedError;
  Area? get selectedBlock => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BattleSelectionCopyWith<BattleSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleSelectionCopyWith<$Res> {
  factory $BattleSelectionCopyWith(
          BattleSelection value, $Res Function(BattleSelection) then) =
      _$BattleSelectionCopyWithImpl<$Res, BattleSelection>;
  @useResult
  $Res call({Area? selectedAttack, Area? selectedBlock});
}

/// @nodoc
class _$BattleSelectionCopyWithImpl<$Res, $Val extends BattleSelection>
    implements $BattleSelectionCopyWith<$Res> {
  _$BattleSelectionCopyWithImpl(this._value, this._then);

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
abstract class _$$BattleSelectionImplCopyWith<$Res>
    implements $BattleSelectionCopyWith<$Res> {
  factory _$$BattleSelectionImplCopyWith(_$BattleSelectionImpl value,
          $Res Function(_$BattleSelectionImpl) then) =
      __$$BattleSelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Area? selectedAttack, Area? selectedBlock});
}

/// @nodoc
class __$$BattleSelectionImplCopyWithImpl<$Res>
    extends _$BattleSelectionCopyWithImpl<$Res, _$BattleSelectionImpl>
    implements _$$BattleSelectionImplCopyWith<$Res> {
  __$$BattleSelectionImplCopyWithImpl(
      _$BattleSelectionImpl _value, $Res Function(_$BattleSelectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAttack = freezed,
    Object? selectedBlock = freezed,
  }) {
    return _then(_$BattleSelectionImpl(
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
class _$BattleSelectionImpl implements _BattleSelection {
  const _$BattleSelectionImpl({this.selectedAttack, this.selectedBlock});

  factory _$BattleSelectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$BattleSelectionImplFromJson(json);

  @override
  final Area? selectedAttack;
  @override
  final Area? selectedBlock;

  @override
  String toString() {
    return 'BattleSelection(selectedAttack: $selectedAttack, selectedBlock: $selectedBlock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleSelectionImpl &&
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
  _$$BattleSelectionImplCopyWith<_$BattleSelectionImpl> get copyWith =>
      __$$BattleSelectionImplCopyWithImpl<_$BattleSelectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BattleSelectionImplToJson(
      this,
    );
  }
}

abstract class _BattleSelection implements BattleSelection {
  const factory _BattleSelection(
      {final Area? selectedAttack,
      final Area? selectedBlock}) = _$BattleSelectionImpl;

  factory _BattleSelection.fromJson(Map<String, dynamic> json) =
      _$BattleSelectionImpl.fromJson;

  @override
  Area? get selectedAttack;
  @override
  Area? get selectedBlock;
  @override
  @JsonKey(ignore: true)
  _$$BattleSelectionImplCopyWith<_$BattleSelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
