// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'creation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreationState {

 String get name; int get remainingPoints; int get vitality; int get strength;
/// Create a copy of CreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreationStateCopyWith<CreationState> get copyWith => _$CreationStateCopyWithImpl<CreationState>(this as CreationState, _$identity);

  /// Serializes this CreationState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreationState&&(identical(other.name, name) || other.name == name)&&(identical(other.remainingPoints, remainingPoints) || other.remainingPoints == remainingPoints)&&(identical(other.vitality, vitality) || other.vitality == vitality)&&(identical(other.strength, strength) || other.strength == strength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,remainingPoints,vitality,strength);

@override
String toString() {
  return 'CreationState(name: $name, remainingPoints: $remainingPoints, vitality: $vitality, strength: $strength)';
}


}

/// @nodoc
abstract mixin class $CreationStateCopyWith<$Res>  {
  factory $CreationStateCopyWith(CreationState value, $Res Function(CreationState) _then) = _$CreationStateCopyWithImpl;
@useResult
$Res call({
 String name, int remainingPoints, int vitality, int strength
});




}
/// @nodoc
class _$CreationStateCopyWithImpl<$Res>
    implements $CreationStateCopyWith<$Res> {
  _$CreationStateCopyWithImpl(this._self, this._then);

  final CreationState _self;
  final $Res Function(CreationState) _then;

/// Create a copy of CreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? remainingPoints = null,Object? vitality = null,Object? strength = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,remainingPoints: null == remainingPoints ? _self.remainingPoints : remainingPoints // ignore: cast_nullable_to_non_nullable
as int,vitality: null == vitality ? _self.vitality : vitality // ignore: cast_nullable_to_non_nullable
as int,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CreationState].
extension CreationStatePatterns on CreationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreationState value)  $default,){
final _that = this;
switch (_that) {
case _CreationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreationState value)?  $default,){
final _that = this;
switch (_that) {
case _CreationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int remainingPoints,  int vitality,  int strength)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreationState() when $default != null:
return $default(_that.name,_that.remainingPoints,_that.vitality,_that.strength);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int remainingPoints,  int vitality,  int strength)  $default,) {final _that = this;
switch (_that) {
case _CreationState():
return $default(_that.name,_that.remainingPoints,_that.vitality,_that.strength);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int remainingPoints,  int vitality,  int strength)?  $default,) {final _that = this;
switch (_that) {
case _CreationState() when $default != null:
return $default(_that.name,_that.remainingPoints,_that.vitality,_that.strength);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreationState extends CreationState {
  const _CreationState({this.name = '', this.remainingPoints = 5, this.vitality = 3, this.strength = 3}): super._();
  factory _CreationState.fromJson(Map<String, dynamic> json) => _$CreationStateFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  int remainingPoints;
@override@JsonKey() final  int vitality;
@override@JsonKey() final  int strength;

/// Create a copy of CreationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreationStateCopyWith<_CreationState> get copyWith => __$CreationStateCopyWithImpl<_CreationState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreationStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreationState&&(identical(other.name, name) || other.name == name)&&(identical(other.remainingPoints, remainingPoints) || other.remainingPoints == remainingPoints)&&(identical(other.vitality, vitality) || other.vitality == vitality)&&(identical(other.strength, strength) || other.strength == strength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,remainingPoints,vitality,strength);

@override
String toString() {
  return 'CreationState(name: $name, remainingPoints: $remainingPoints, vitality: $vitality, strength: $strength)';
}


}

/// @nodoc
abstract mixin class _$CreationStateCopyWith<$Res> implements $CreationStateCopyWith<$Res> {
  factory _$CreationStateCopyWith(_CreationState value, $Res Function(_CreationState) _then) = __$CreationStateCopyWithImpl;
@override @useResult
$Res call({
 String name, int remainingPoints, int vitality, int strength
});




}
/// @nodoc
class __$CreationStateCopyWithImpl<$Res>
    implements _$CreationStateCopyWith<$Res> {
  __$CreationStateCopyWithImpl(this._self, this._then);

  final _CreationState _self;
  final $Res Function(_CreationState) _then;

/// Create a copy of CreationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? remainingPoints = null,Object? vitality = null,Object? strength = null,}) {
  return _then(_CreationState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,remainingPoints: null == remainingPoints ? _self.remainingPoints : remainingPoints // ignore: cast_nullable_to_non_nullable
as int,vitality: null == vitality ? _self.vitality : vitality // ignore: cast_nullable_to_non_nullable
as int,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
