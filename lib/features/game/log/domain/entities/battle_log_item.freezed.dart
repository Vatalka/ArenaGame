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
BattleLogItem _$BattleLogItemFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'info':
          return _InfoLog.fromJson(
            json
          );
                case 'attack':
          return _AttackLog.fromJson(
            json
          );
                case 'block':
          return _BlockLog.fromJson(
            json
          );
                case 'startBattle':
          return _StartBattleLog.fromJson(
            json
          );
                case 'endBattle':
          return _EndBattleLog.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'BattleLogItem',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$BattleLogItem {

 String get id; DateTime get timestamp;
/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattleLogItemCopyWith<BattleLogItem> get copyWith => _$BattleLogItemCopyWithImpl<BattleLogItem>(this as BattleLogItem, _$identity);

  /// Serializes this BattleLogItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleLogItem&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp);

@override
String toString() {
  return 'BattleLogItem(id: $id, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $BattleLogItemCopyWith<$Res>  {
  factory $BattleLogItemCopyWith(BattleLogItem value, $Res Function(BattleLogItem) _then) = _$BattleLogItemCopyWithImpl;
@useResult
$Res call({
 String id, DateTime timestamp
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InfoLog value)?  info,TResult Function( _AttackLog value)?  attack,TResult Function( _BlockLog value)?  block,TResult Function( _StartBattleLog value)?  startBattle,TResult Function( _EndBattleLog value)?  endBattle,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfoLog() when info != null:
return info(_that);case _AttackLog() when attack != null:
return attack(_that);case _BlockLog() when block != null:
return block(_that);case _StartBattleLog() when startBattle != null:
return startBattle(_that);case _EndBattleLog() when endBattle != null:
return endBattle(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InfoLog value)  info,required TResult Function( _AttackLog value)  attack,required TResult Function( _BlockLog value)  block,required TResult Function( _StartBattleLog value)  startBattle,required TResult Function( _EndBattleLog value)  endBattle,}){
final _that = this;
switch (_that) {
case _InfoLog():
return info(_that);case _AttackLog():
return attack(_that);case _BlockLog():
return block(_that);case _StartBattleLog():
return startBattle(_that);case _EndBattleLog():
return endBattle(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InfoLog value)?  info,TResult? Function( _AttackLog value)?  attack,TResult? Function( _BlockLog value)?  block,TResult? Function( _StartBattleLog value)?  startBattle,TResult? Function( _EndBattleLog value)?  endBattle,}){
final _that = this;
switch (_that) {
case _InfoLog() when info != null:
return info(_that);case _AttackLog() when attack != null:
return attack(_that);case _BlockLog() when block != null:
return block(_that);case _StartBattleLog() when startBattle != null:
return startBattle(_that);case _EndBattleLog() when endBattle != null:
return endBattle(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  DateTime timestamp,  String message)?  info,TResult Function( String id,  DateTime timestamp,  String attackerName,  Area area,  int damage)?  attack,TResult Function( String id,  DateTime timestamp,  String defenderName,  Area area)?  block,TResult Function( String id,  DateTime timestamp,  String playerName,  String botName)?  startBattle,TResult Function( String id,  DateTime timestamp,  BattleResult result,  String winnerName)?  endBattle,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfoLog() when info != null:
return info(_that.id,_that.timestamp,_that.message);case _AttackLog() when attack != null:
return attack(_that.id,_that.timestamp,_that.attackerName,_that.area,_that.damage);case _BlockLog() when block != null:
return block(_that.id,_that.timestamp,_that.defenderName,_that.area);case _StartBattleLog() when startBattle != null:
return startBattle(_that.id,_that.timestamp,_that.playerName,_that.botName);case _EndBattleLog() when endBattle != null:
return endBattle(_that.id,_that.timestamp,_that.result,_that.winnerName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  DateTime timestamp,  String message)  info,required TResult Function( String id,  DateTime timestamp,  String attackerName,  Area area,  int damage)  attack,required TResult Function( String id,  DateTime timestamp,  String defenderName,  Area area)  block,required TResult Function( String id,  DateTime timestamp,  String playerName,  String botName)  startBattle,required TResult Function( String id,  DateTime timestamp,  BattleResult result,  String winnerName)  endBattle,}) {final _that = this;
switch (_that) {
case _InfoLog():
return info(_that.id,_that.timestamp,_that.message);case _AttackLog():
return attack(_that.id,_that.timestamp,_that.attackerName,_that.area,_that.damage);case _BlockLog():
return block(_that.id,_that.timestamp,_that.defenderName,_that.area);case _StartBattleLog():
return startBattle(_that.id,_that.timestamp,_that.playerName,_that.botName);case _EndBattleLog():
return endBattle(_that.id,_that.timestamp,_that.result,_that.winnerName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  DateTime timestamp,  String message)?  info,TResult? Function( String id,  DateTime timestamp,  String attackerName,  Area area,  int damage)?  attack,TResult? Function( String id,  DateTime timestamp,  String defenderName,  Area area)?  block,TResult? Function( String id,  DateTime timestamp,  String playerName,  String botName)?  startBattle,TResult? Function( String id,  DateTime timestamp,  BattleResult result,  String winnerName)?  endBattle,}) {final _that = this;
switch (_that) {
case _InfoLog() when info != null:
return info(_that.id,_that.timestamp,_that.message);case _AttackLog() when attack != null:
return attack(_that.id,_that.timestamp,_that.attackerName,_that.area,_that.damage);case _BlockLog() when block != null:
return block(_that.id,_that.timestamp,_that.defenderName,_that.area);case _StartBattleLog() when startBattle != null:
return startBattle(_that.id,_that.timestamp,_that.playerName,_that.botName);case _EndBattleLog() when endBattle != null:
return endBattle(_that.id,_that.timestamp,_that.result,_that.winnerName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InfoLog implements BattleLogItem {
  const _InfoLog({required this.id, required this.timestamp, required this.message, final  String? $type}): $type = $type ?? 'info';
  factory _InfoLog.fromJson(Map<String, dynamic> json) => _$InfoLogFromJson(json);

@override final  String id;
@override final  DateTime timestamp;
 final  String message;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfoLogCopyWith<_InfoLog> get copyWith => __$InfoLogCopyWithImpl<_InfoLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InfoLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfoLog&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,message);

@override
String toString() {
  return 'BattleLogItem.info(id: $id, timestamp: $timestamp, message: $message)';
}


}

/// @nodoc
abstract mixin class _$InfoLogCopyWith<$Res> implements $BattleLogItemCopyWith<$Res> {
  factory _$InfoLogCopyWith(_InfoLog value, $Res Function(_InfoLog) _then) = __$InfoLogCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime timestamp, String message
});




}
/// @nodoc
class __$InfoLogCopyWithImpl<$Res>
    implements _$InfoLogCopyWith<$Res> {
  __$InfoLogCopyWithImpl(this._self, this._then);

  final _InfoLog _self;
  final $Res Function(_InfoLog) _then;

/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timestamp = null,Object? message = null,}) {
  return _then(_InfoLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _AttackLog implements BattleLogItem {
  const _AttackLog({required this.id, required this.timestamp, required this.attackerName, required this.area, required this.damage, final  String? $type}): $type = $type ?? 'attack';
  factory _AttackLog.fromJson(Map<String, dynamic> json) => _$AttackLogFromJson(json);

@override final  String id;
@override final  DateTime timestamp;
 final  String attackerName;
 final  Area area;
 final  int damage;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttackLogCopyWith<_AttackLog> get copyWith => __$AttackLogCopyWithImpl<_AttackLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttackLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttackLog&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.attackerName, attackerName) || other.attackerName == attackerName)&&(identical(other.area, area) || other.area == area)&&(identical(other.damage, damage) || other.damage == damage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,attackerName,area,damage);

@override
String toString() {
  return 'BattleLogItem.attack(id: $id, timestamp: $timestamp, attackerName: $attackerName, area: $area, damage: $damage)';
}


}

/// @nodoc
abstract mixin class _$AttackLogCopyWith<$Res> implements $BattleLogItemCopyWith<$Res> {
  factory _$AttackLogCopyWith(_AttackLog value, $Res Function(_AttackLog) _then) = __$AttackLogCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime timestamp, String attackerName, Area area, int damage
});




}
/// @nodoc
class __$AttackLogCopyWithImpl<$Res>
    implements _$AttackLogCopyWith<$Res> {
  __$AttackLogCopyWithImpl(this._self, this._then);

  final _AttackLog _self;
  final $Res Function(_AttackLog) _then;

/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timestamp = null,Object? attackerName = null,Object? area = null,Object? damage = null,}) {
  return _then(_AttackLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,attackerName: null == attackerName ? _self.attackerName : attackerName // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as Area,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _BlockLog implements BattleLogItem {
  const _BlockLog({required this.id, required this.timestamp, required this.defenderName, required this.area, final  String? $type}): $type = $type ?? 'block';
  factory _BlockLog.fromJson(Map<String, dynamic> json) => _$BlockLogFromJson(json);

@override final  String id;
@override final  DateTime timestamp;
 final  String defenderName;
 final  Area area;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockLogCopyWith<_BlockLog> get copyWith => __$BlockLogCopyWithImpl<_BlockLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlockLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockLog&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.defenderName, defenderName) || other.defenderName == defenderName)&&(identical(other.area, area) || other.area == area));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,defenderName,area);

@override
String toString() {
  return 'BattleLogItem.block(id: $id, timestamp: $timestamp, defenderName: $defenderName, area: $area)';
}


}

/// @nodoc
abstract mixin class _$BlockLogCopyWith<$Res> implements $BattleLogItemCopyWith<$Res> {
  factory _$BlockLogCopyWith(_BlockLog value, $Res Function(_BlockLog) _then) = __$BlockLogCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime timestamp, String defenderName, Area area
});




}
/// @nodoc
class __$BlockLogCopyWithImpl<$Res>
    implements _$BlockLogCopyWith<$Res> {
  __$BlockLogCopyWithImpl(this._self, this._then);

  final _BlockLog _self;
  final $Res Function(_BlockLog) _then;

/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timestamp = null,Object? defenderName = null,Object? area = null,}) {
  return _then(_BlockLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,defenderName: null == defenderName ? _self.defenderName : defenderName // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as Area,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _StartBattleLog implements BattleLogItem {
  const _StartBattleLog({required this.id, required this.timestamp, required this.playerName, required this.botName, final  String? $type}): $type = $type ?? 'startBattle';
  factory _StartBattleLog.fromJson(Map<String, dynamic> json) => _$StartBattleLogFromJson(json);

@override final  String id;
@override final  DateTime timestamp;
 final  String playerName;
 final  String botName;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartBattleLogCopyWith<_StartBattleLog> get copyWith => __$StartBattleLogCopyWithImpl<_StartBattleLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StartBattleLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartBattleLog&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.playerName, playerName) || other.playerName == playerName)&&(identical(other.botName, botName) || other.botName == botName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,playerName,botName);

@override
String toString() {
  return 'BattleLogItem.startBattle(id: $id, timestamp: $timestamp, playerName: $playerName, botName: $botName)';
}


}

/// @nodoc
abstract mixin class _$StartBattleLogCopyWith<$Res> implements $BattleLogItemCopyWith<$Res> {
  factory _$StartBattleLogCopyWith(_StartBattleLog value, $Res Function(_StartBattleLog) _then) = __$StartBattleLogCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime timestamp, String playerName, String botName
});




}
/// @nodoc
class __$StartBattleLogCopyWithImpl<$Res>
    implements _$StartBattleLogCopyWith<$Res> {
  __$StartBattleLogCopyWithImpl(this._self, this._then);

  final _StartBattleLog _self;
  final $Res Function(_StartBattleLog) _then;

/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timestamp = null,Object? playerName = null,Object? botName = null,}) {
  return _then(_StartBattleLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,playerName: null == playerName ? _self.playerName : playerName // ignore: cast_nullable_to_non_nullable
as String,botName: null == botName ? _self.botName : botName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _EndBattleLog implements BattleLogItem {
  const _EndBattleLog({required this.id, required this.timestamp, required this.result, required this.winnerName, final  String? $type}): $type = $type ?? 'endBattle';
  factory _EndBattleLog.fromJson(Map<String, dynamic> json) => _$EndBattleLogFromJson(json);

@override final  String id;
@override final  DateTime timestamp;
 final  BattleResult result;
 final  String winnerName;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EndBattleLogCopyWith<_EndBattleLog> get copyWith => __$EndBattleLogCopyWithImpl<_EndBattleLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EndBattleLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EndBattleLog&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.result, result) || other.result == result)&&(identical(other.winnerName, winnerName) || other.winnerName == winnerName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,result,winnerName);

@override
String toString() {
  return 'BattleLogItem.endBattle(id: $id, timestamp: $timestamp, result: $result, winnerName: $winnerName)';
}


}

/// @nodoc
abstract mixin class _$EndBattleLogCopyWith<$Res> implements $BattleLogItemCopyWith<$Res> {
  factory _$EndBattleLogCopyWith(_EndBattleLog value, $Res Function(_EndBattleLog) _then) = __$EndBattleLogCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime timestamp, BattleResult result, String winnerName
});




}
/// @nodoc
class __$EndBattleLogCopyWithImpl<$Res>
    implements _$EndBattleLogCopyWith<$Res> {
  __$EndBattleLogCopyWithImpl(this._self, this._then);

  final _EndBattleLog _self;
  final $Res Function(_EndBattleLog) _then;

/// Create a copy of BattleLogItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timestamp = null,Object? result = null,Object? winnerName = null,}) {
  return _then(_EndBattleLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as BattleResult,winnerName: null == winnerName ? _self.winnerName : winnerName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
