// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
part of sunoom;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SimpleTime {
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;
  int get second => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SimpleTimeCopyWith<SimpleTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleTimeCopyWith<$Res> {
  factory $SimpleTimeCopyWith(
          SimpleTime value, $Res Function(SimpleTime) then) =
      _$SimpleTimeCopyWithImpl<$Res, SimpleTime>;
  @useResult
  $Res call({int hour, int minute, int second});
}

/// @nodoc
class _$SimpleTimeCopyWithImpl<$Res, $Val extends SimpleTime>
    implements $SimpleTimeCopyWith<$Res> {
  _$SimpleTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
    Object? second = null,
  }) {
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      second: null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SimpleTimeCopyWith<$Res>
    implements $SimpleTimeCopyWith<$Res> {
  factory _$$_SimpleTimeCopyWith(
          _$_SimpleTime value, $Res Function(_$_SimpleTime) then) =
      __$$_SimpleTimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int minute, int second});
}

/// @nodoc
class __$$_SimpleTimeCopyWithImpl<$Res>
    extends _$SimpleTimeCopyWithImpl<$Res, _$_SimpleTime>
    implements _$$_SimpleTimeCopyWith<$Res> {
  __$$_SimpleTimeCopyWithImpl(
      _$_SimpleTime _value, $Res Function(_$_SimpleTime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
    Object? second = null,
  }) {
    return _then(_$_SimpleTime(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      second: null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SimpleTime implements _SimpleTime {
  const _$_SimpleTime({this.hour = 0, this.minute = 0, this.second = 0});

  @override
  @JsonKey()
  final int hour;
  @override
  @JsonKey()
  final int minute;
  @override
  @JsonKey()
  final int second;

  @override
  String toString() {
    return 'SimpleTime(hour: $hour, minute: $minute, second: $second)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimpleTime &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.second, second) || other.second == second));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hour, minute, second);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SimpleTimeCopyWith<_$_SimpleTime> get copyWith =>
      __$$_SimpleTimeCopyWithImpl<_$_SimpleTime>(this, _$identity);
}

abstract class _SimpleTime implements SimpleTime {
  const factory _SimpleTime(
      {final int hour, final int minute, final int second}) = _$_SimpleTime;

  @override
  int get hour;
  @override
  int get minute;
  @override
  int get second;
  @override
  @JsonKey(ignore: true)
  _$$_SimpleTimeCopyWith<_$_SimpleTime> get copyWith =>
      throw _privateConstructorUsedError;
}
