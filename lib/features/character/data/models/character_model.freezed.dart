// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterModel {

 String get id; String get name; int get currentHp; int get vitality; int get strength;@JsonKey(defaultValue: 0) int get lastUpdateTime;
/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterModelCopyWith<CharacterModel> get copyWith => _$CharacterModelCopyWithImpl<CharacterModel>(this as CharacterModel, _$identity);

  /// Serializes this CharacterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.currentHp, currentHp) || other.currentHp == currentHp)&&(identical(other.vitality, vitality) || other.vitality == vitality)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.lastUpdateTime, lastUpdateTime) || other.lastUpdateTime == lastUpdateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,currentHp,vitality,strength,lastUpdateTime);

@override
String toString() {
  return 'CharacterModel(id: $id, name: $name, currentHp: $currentHp, vitality: $vitality, strength: $strength, lastUpdateTime: $lastUpdateTime)';
}


}

/// @nodoc
abstract mixin class $CharacterModelCopyWith<$Res>  {
  factory $CharacterModelCopyWith(CharacterModel value, $Res Function(CharacterModel) _then) = _$CharacterModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, int currentHp, int vitality, int strength,@JsonKey(defaultValue: 0) int lastUpdateTime
});




}
/// @nodoc
class _$CharacterModelCopyWithImpl<$Res>
    implements $CharacterModelCopyWith<$Res> {
  _$CharacterModelCopyWithImpl(this._self, this._then);

  final CharacterModel _self;
  final $Res Function(CharacterModel) _then;

/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? currentHp = null,Object? vitality = null,Object? strength = null,Object? lastUpdateTime = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currentHp: null == currentHp ? _self.currentHp : currentHp // ignore: cast_nullable_to_non_nullable
as int,vitality: null == vitality ? _self.vitality : vitality // ignore: cast_nullable_to_non_nullable
as int,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as int,lastUpdateTime: null == lastUpdateTime ? _self.lastUpdateTime : lastUpdateTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CharacterModel].
extension CharacterModelPatterns on CharacterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterModel value)  $default,){
final _that = this;
switch (_that) {
case _CharacterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterModel value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int currentHp,  int vitality,  int strength, @JsonKey(defaultValue: 0)  int lastUpdateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterModel() when $default != null:
return $default(_that.id,_that.name,_that.currentHp,_that.vitality,_that.strength,_that.lastUpdateTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int currentHp,  int vitality,  int strength, @JsonKey(defaultValue: 0)  int lastUpdateTime)  $default,) {final _that = this;
switch (_that) {
case _CharacterModel():
return $default(_that.id,_that.name,_that.currentHp,_that.vitality,_that.strength,_that.lastUpdateTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int currentHp,  int vitality,  int strength, @JsonKey(defaultValue: 0)  int lastUpdateTime)?  $default,) {final _that = this;
switch (_that) {
case _CharacterModel() when $default != null:
return $default(_that.id,_that.name,_that.currentHp,_that.vitality,_that.strength,_that.lastUpdateTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CharacterModel implements CharacterModel {
  const _CharacterModel({required this.id, required this.name, required this.currentHp, required this.vitality, required this.strength, @JsonKey(defaultValue: 0) required this.lastUpdateTime});
  factory _CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  int currentHp;
@override final  int vitality;
@override final  int strength;
@override@JsonKey(defaultValue: 0) final  int lastUpdateTime;

/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterModelCopyWith<_CharacterModel> get copyWith => __$CharacterModelCopyWithImpl<_CharacterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.currentHp, currentHp) || other.currentHp == currentHp)&&(identical(other.vitality, vitality) || other.vitality == vitality)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.lastUpdateTime, lastUpdateTime) || other.lastUpdateTime == lastUpdateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,currentHp,vitality,strength,lastUpdateTime);

@override
String toString() {
  return 'CharacterModel(id: $id, name: $name, currentHp: $currentHp, vitality: $vitality, strength: $strength, lastUpdateTime: $lastUpdateTime)';
}


}

/// @nodoc
abstract mixin class _$CharacterModelCopyWith<$Res> implements $CharacterModelCopyWith<$Res> {
  factory _$CharacterModelCopyWith(_CharacterModel value, $Res Function(_CharacterModel) _then) = __$CharacterModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int currentHp, int vitality, int strength,@JsonKey(defaultValue: 0) int lastUpdateTime
});




}
/// @nodoc
class __$CharacterModelCopyWithImpl<$Res>
    implements _$CharacterModelCopyWith<$Res> {
  __$CharacterModelCopyWithImpl(this._self, this._then);

  final _CharacterModel _self;
  final $Res Function(_CharacterModel) _then;

/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? currentHp = null,Object? vitality = null,Object? strength = null,Object? lastUpdateTime = null,}) {
  return _then(_CharacterModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currentHp: null == currentHp ? _self.currentHp : currentHp // ignore: cast_nullable_to_non_nullable
as int,vitality: null == vitality ? _self.vitality : vitality // ignore: cast_nullable_to_non_nullable
as int,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as int,lastUpdateTime: null == lastUpdateTime ? _self.lastUpdateTime : lastUpdateTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
