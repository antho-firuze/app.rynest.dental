// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'practice_hour.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PracticeHour _$PracticeHourFromJson(Map<String, dynamic> json) {
  return _PracticeHour.fromJson(json);
}

/// @nodoc
mixin _$PracticeHour {
  int? get time => throw _privateConstructorUsedError;

  /// Serializes this PracticeHour to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PracticeHour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PracticeHourCopyWith<PracticeHour> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PracticeHourCopyWith<$Res> {
  factory $PracticeHourCopyWith(
          PracticeHour value, $Res Function(PracticeHour) then) =
      _$PracticeHourCopyWithImpl<$Res, PracticeHour>;
  @useResult
  $Res call({int? time});
}

/// @nodoc
class _$PracticeHourCopyWithImpl<$Res, $Val extends PracticeHour>
    implements $PracticeHourCopyWith<$Res> {
  _$PracticeHourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PracticeHour
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PracticeHourImplCopyWith<$Res>
    implements $PracticeHourCopyWith<$Res> {
  factory _$$PracticeHourImplCopyWith(
          _$PracticeHourImpl value, $Res Function(_$PracticeHourImpl) then) =
      __$$PracticeHourImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? time});
}

/// @nodoc
class __$$PracticeHourImplCopyWithImpl<$Res>
    extends _$PracticeHourCopyWithImpl<$Res, _$PracticeHourImpl>
    implements _$$PracticeHourImplCopyWith<$Res> {
  __$$PracticeHourImplCopyWithImpl(
      _$PracticeHourImpl _value, $Res Function(_$PracticeHourImpl) _then)
      : super(_value, _then);

  /// Create a copy of PracticeHour
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
  }) {
    return _then(_$PracticeHourImpl(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PracticeHourImpl implements _PracticeHour {
  _$PracticeHourImpl({this.time});

  factory _$PracticeHourImpl.fromJson(Map<String, dynamic> json) =>
      _$$PracticeHourImplFromJson(json);

  @override
  final int? time;

  @override
  String toString() {
    return 'PracticeHour(time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PracticeHourImpl &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time);

  /// Create a copy of PracticeHour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PracticeHourImplCopyWith<_$PracticeHourImpl> get copyWith =>
      __$$PracticeHourImplCopyWithImpl<_$PracticeHourImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PracticeHourImplToJson(
      this,
    );
  }
}

abstract class _PracticeHour implements PracticeHour {
  factory _PracticeHour({final int? time}) = _$PracticeHourImpl;

  factory _PracticeHour.fromJson(Map<String, dynamic> json) =
      _$PracticeHourImpl.fromJson;

  @override
  int? get time;

  /// Create a copy of PracticeHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PracticeHourImplCopyWith<_$PracticeHourImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
