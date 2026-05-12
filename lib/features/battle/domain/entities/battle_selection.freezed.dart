// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BattleSelection {

 Area? get selectedAttack; Area? get selectedBlock;
/// Create a copy of BattleSelection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattleSelectionCopyWith<BattleSelection> get copyWith => _$BattleSelectionCopyWithImpl<BattleSelection>(this as BattleSelection, _$identity);

  /// Serializes this BattleSelection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleSelection&&(identical(other.selectedAttack, selectedAttack) || other.selectedAttack == selectedAttack)&&(identical(other.selectedBlock, selectedBlock) || other.selectedBlock == selectedBlock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,selectedAttack,selectedBlock);

@override
String toString() {
  return 'BattleSelection(selectedAttack: $selectedAttack, selectedBlock: $selectedBlock)';
}


}

/// @nodoc
abstract mixin class $BattleSelectionCopyWith<$Res>  {
  factory $BattleSelectionCopyWith(BattleSelection value, $Res Function(BattleSelection) _then) = _$BattleSelectionCopyWithImpl;
@useResult
$Res call({
 Area? selectedAttack, Area? selectedBlock
});




}
/// @nodoc
class _$BattleSelectionCopyWithImpl<$Res>
    implements $BattleSelectionCopyWith<$Res> {
  _$BattleSelectionCopyWithImpl(this._self, this._then);

  final BattleSelection _self;
  final $Res Function(BattleSelection) _then;

/// Create a copy of BattleSelection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedAttack = freezed,Object? selectedBlock = freezed,}) {
  return _then(_self.copyWith(
selectedAttack: freezed == selectedAttack ? _self.selectedAttack : selectedAttack // ignore: cast_nullable_to_non_nullable
as Area?,selectedBlock: freezed == selectedBlock ? _self.selectedBlock : selectedBlock // ignore: cast_nullable_to_non_nullable
as Area?,
  ));
}

}


/// Adds pattern-matching-related methods to [BattleSelection].
extension BattleSelectionPatterns on BattleSelection {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BattleSelection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BattleSelection() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BattleSelection value)  $default,){
final _that = this;
switch (_that) {
case _BattleSelection():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BattleSelection value)?  $default,){
final _that = this;
switch (_that) {
case _BattleSelection() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Area? selectedAttack,  Area? selectedBlock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BattleSelection() when $default != null:
return $default(_that.selectedAttack,_that.selectedBlock);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Area? selectedAttack,  Area? selectedBlock)  $default,) {final _that = this;
switch (_that) {
case _BattleSelection():
return $default(_that.selectedAttack,_that.selectedBlock);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Area? selectedAttack,  Area? selectedBlock)?  $default,) {final _that = this;
switch (_that) {
case _BattleSelection() when $default != null:
return $default(_that.selectedAttack,_that.selectedBlock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BattleSelection extends BattleSelection {
  const _BattleSelection({this.selectedAttack, this.selectedBlock}): super._();
  factory _BattleSelection.fromJson(Map<String, dynamic> json) => _$BattleSelectionFromJson(json);

@override final  Area? selectedAttack;
@override final  Area? selectedBlock;

/// Create a copy of BattleSelection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BattleSelectionCopyWith<_BattleSelection> get copyWith => __$BattleSelectionCopyWithImpl<_BattleSelection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BattleSelectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BattleSelection&&(identical(other.selectedAttack, selectedAttack) || other.selectedAttack == selectedAttack)&&(identical(other.selectedBlock, selectedBlock) || other.selectedBlock == selectedBlock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,selectedAttack,selectedBlock);

@override
String toString() {
  return 'BattleSelection(selectedAttack: $selectedAttack, selectedBlock: $selectedBlock)';
}


}

/// @nodoc
abstract mixin class _$BattleSelectionCopyWith<$Res> implements $BattleSelectionCopyWith<$Res> {
  factory _$BattleSelectionCopyWith(_BattleSelection value, $Res Function(_BattleSelection) _then) = __$BattleSelectionCopyWithImpl;
@override @useResult
$Res call({
 Area? selectedAttack, Area? selectedBlock
});




}
/// @nodoc
class __$BattleSelectionCopyWithImpl<$Res>
    implements _$BattleSelectionCopyWith<$Res> {
  __$BattleSelectionCopyWithImpl(this._self, this._then);

  final _BattleSelection _self;
  final $Res Function(_BattleSelection) _then;

/// Create a copy of BattleSelection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedAttack = freezed,Object? selectedBlock = freezed,}) {
  return _then(_BattleSelection(
selectedAttack: freezed == selectedAttack ? _self.selectedAttack : selectedAttack // ignore: cast_nullable_to_non_nullable
as Area?,selectedBlock: freezed == selectedBlock ? _self.selectedBlock : selectedBlock // ignore: cast_nullable_to_non_nullable
as Area?,
  ));
}


}

// dart format on
