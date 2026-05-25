// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_log_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BattleLogItem {

 String get id; DateTime get timestamp; String get message; LogType get type;
/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattleLogItemCopyWith<BattleLogItem> get copyWith => _$BattleLogItemCopyWithImpl<BattleLogItem>(this as BattleLogItem, _$identity);

  /// Serializes this BattleLogItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleLogItem&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.message, message) || other.message == message)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,message,type);

@override
String toString() {
  return 'BattleLogItem(id: $id, timestamp: $timestamp, message: $message, type: $type)';
}


}

/// @nodoc
abstract mixin class $BattleLogItemCopyWith<$Res>  {
  factory $BattleLogItemCopyWith(BattleLogItem value, $Res Function(BattleLogItem) _then) = _$BattleLogItemCopyWithImpl;
@useResult
$Res call({
 String id, DateTime timestamp, String message, LogType type
});




}
/// @nodoc
class _$BattleLogItemCopyWithImpl<$Res>
    implements $BattleLogItemCopyWith<$Res> {
  _$BattleLogItemCopyWithImpl(this._self, this._then);

  final BattleLogItem _self;
  final $Res Function(BattleLogItem) _then;

/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? timestamp = null,Object? message = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LogType,
  ));
}

}


/// Adds pattern-matching-related methods to [BattleLogItem].
extension BattleLogItemPatterns on BattleLogItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BattleLogItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BattleLogItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BattleLogItem value)  $default,){
final _that = this;
switch (_that) {
case _BattleLogItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BattleLogItem value)?  $default,){
final _that = this;
switch (_that) {
case _BattleLogItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime timestamp,  String message,  LogType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BattleLogItem() when $default != null:
return $default(_that.id,_that.timestamp,_that.message,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime timestamp,  String message,  LogType type)  $default,) {final _that = this;
switch (_that) {
case _BattleLogItem():
return $default(_that.id,_that.timestamp,_that.message,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime timestamp,  String message,  LogType type)?  $default,) {final _that = this;
switch (_that) {
case _BattleLogItem() when $default != null:
return $default(_that.id,_that.timestamp,_that.message,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BattleLogItem implements BattleLogItem {
  const _BattleLogItem({required this.id, required this.timestamp, required this.message, required this.type});
  factory _BattleLogItem.fromJson(Map<String, dynamic> json) => _$BattleLogItemFromJson(json);

@override final  String id;
@override final  DateTime timestamp;
@override final  String message;
@override final  LogType type;

/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BattleLogItemCopyWith<_BattleLogItem> get copyWith => __$BattleLogItemCopyWithImpl<_BattleLogItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BattleLogItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BattleLogItem&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.message, message) || other.message == message)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,message,type);

@override
String toString() {
  return 'BattleLogItem(id: $id, timestamp: $timestamp, message: $message, type: $type)';
}


}

/// @nodoc
abstract mixin class _$BattleLogItemCopyWith<$Res> implements $BattleLogItemCopyWith<$Res> {
  factory _$BattleLogItemCopyWith(_BattleLogItem value, $Res Function(_BattleLogItem) _then) = __$BattleLogItemCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime timestamp, String message, LogType type
});




}
/// @nodoc
class __$BattleLogItemCopyWithImpl<$Res>
    implements _$BattleLogItemCopyWith<$Res> {
  __$BattleLogItemCopyWithImpl(this._self, this._then);

  final _BattleLogItem _self;
  final $Res Function(_BattleLogItem) _then;

/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timestamp = null,Object? message = null,Object? type = null,}) {
  return _then(_BattleLogItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LogType,
  ));
}


}

// dart format on
