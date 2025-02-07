// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medical_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MedicalRecord _$MedicalRecordFromJson(Map<String, dynamic> json) {
  return _MedicalRecord.fromJson(json);
}

/// @nodoc
mixin _$MedicalRecord {
  String? get treatment => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  String? get doctor => throw _privateConstructorUsedError;
  List<int>? get location => throw _privateConstructorUsedError;
  String? get diagnosis => throw _privateConstructorUsedError;

  /// Serializes this MedicalRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicalRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicalRecordCopyWith<MedicalRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalRecordCopyWith<$Res> {
  factory $MedicalRecordCopyWith(
          MedicalRecord value, $Res Function(MedicalRecord) then) =
      _$MedicalRecordCopyWithImpl<$Res, MedicalRecord>;
  @useResult
  $Res call(
      {String? treatment,
      DateTime? date,
      String? doctor,
      List<int>? location,
      String? diagnosis});
}

/// @nodoc
class _$MedicalRecordCopyWithImpl<$Res, $Val extends MedicalRecord>
    implements $MedicalRecordCopyWith<$Res> {
  _$MedicalRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicalRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? treatment = freezed,
    Object? date = freezed,
    Object? doctor = freezed,
    Object? location = freezed,
    Object? diagnosis = freezed,
  }) {
    return _then(_value.copyWith(
      treatment: freezed == treatment
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      diagnosis: freezed == diagnosis
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MedicalRecordImplCopyWith<$Res>
    implements $MedicalRecordCopyWith<$Res> {
  factory _$$MedicalRecordImplCopyWith(
          _$MedicalRecordImpl value, $Res Function(_$MedicalRecordImpl) then) =
      __$$MedicalRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? treatment,
      DateTime? date,
      String? doctor,
      List<int>? location,
      String? diagnosis});
}

/// @nodoc
class __$$MedicalRecordImplCopyWithImpl<$Res>
    extends _$MedicalRecordCopyWithImpl<$Res, _$MedicalRecordImpl>
    implements _$$MedicalRecordImplCopyWith<$Res> {
  __$$MedicalRecordImplCopyWithImpl(
      _$MedicalRecordImpl _value, $Res Function(_$MedicalRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicalRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? treatment = freezed,
    Object? date = freezed,
    Object? doctor = freezed,
    Object? location = freezed,
    Object? diagnosis = freezed,
  }) {
    return _then(_$MedicalRecordImpl(
      treatment: freezed == treatment
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value._location
          : location // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      diagnosis: freezed == diagnosis
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicalRecordImpl implements _MedicalRecord {
  _$MedicalRecordImpl(
      {this.treatment,
      this.date,
      this.doctor,
      final List<int>? location,
      this.diagnosis})
      : _location = location;

  factory _$MedicalRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicalRecordImplFromJson(json);

  @override
  final String? treatment;
  @override
  final DateTime? date;
  @override
  final String? doctor;
  final List<int>? _location;
  @override
  List<int>? get location {
    final value = _location;
    if (value == null) return null;
    if (_location is EqualUnmodifiableListView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? diagnosis;

  @override
  String toString() {
    return 'MedicalRecord(treatment: $treatment, date: $date, doctor: $doctor, location: $location, diagnosis: $diagnosis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicalRecordImpl &&
            (identical(other.treatment, treatment) ||
                other.treatment == treatment) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            const DeepCollectionEquality().equals(other._location, _location) &&
            (identical(other.diagnosis, diagnosis) ||
                other.diagnosis == diagnosis));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, treatment, date, doctor,
      const DeepCollectionEquality().hash(_location), diagnosis);

  /// Create a copy of MedicalRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicalRecordImplCopyWith<_$MedicalRecordImpl> get copyWith =>
      __$$MedicalRecordImplCopyWithImpl<_$MedicalRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicalRecordImplToJson(
      this,
    );
  }
}

abstract class _MedicalRecord implements MedicalRecord {
  factory _MedicalRecord(
      {final String? treatment,
      final DateTime? date,
      final String? doctor,
      final List<int>? location,
      final String? diagnosis}) = _$MedicalRecordImpl;

  factory _MedicalRecord.fromJson(Map<String, dynamic> json) =
      _$MedicalRecordImpl.fromJson;

  @override
  String? get treatment;
  @override
  DateTime? get date;
  @override
  String? get doctor;
  @override
  List<int>? get location;
  @override
  String? get diagnosis;

  /// Create a copy of MedicalRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicalRecordImplCopyWith<_$MedicalRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
