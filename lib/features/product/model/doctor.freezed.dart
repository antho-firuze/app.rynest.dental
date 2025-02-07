// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Doctor _$DoctorFromJson(Map<String, dynamic> json) {
  return _Doctor.fromJson(json);
}

/// @nodoc
mixin _$Doctor {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'count_patient')
  int? get countPatient => throw _privateConstructorUsedError;
  @JsonKey(name: 'count_experience')
  int? get countExperience => throw _privateConstructorUsedError;
  @JsonKey(name: 'count_review')
  int? get countReview => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_profile')
  String? get shortProfile => throw _privateConstructorUsedError;
  List<Schedule>? get schedules => throw _privateConstructorUsedError;

  /// Serializes this Doctor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorCopyWith<Doctor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorCopyWith<$Res> {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) then) =
      _$DoctorCopyWithImpl<$Res, Doctor>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? photo,
      double? rating,
      @JsonKey(name: 'count_patient') int? countPatient,
      @JsonKey(name: 'count_experience') int? countExperience,
      @JsonKey(name: 'count_review') int? countReview,
      @JsonKey(name: 'short_profile') String? shortProfile,
      List<Schedule>? schedules});
}

/// @nodoc
class _$DoctorCopyWithImpl<$Res, $Val extends Doctor>
    implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photo = freezed,
    Object? rating = freezed,
    Object? countPatient = freezed,
    Object? countExperience = freezed,
    Object? countReview = freezed,
    Object? shortProfile = freezed,
    Object? schedules = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      countPatient: freezed == countPatient
          ? _value.countPatient
          : countPatient // ignore: cast_nullable_to_non_nullable
              as int?,
      countExperience: freezed == countExperience
          ? _value.countExperience
          : countExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      countReview: freezed == countReview
          ? _value.countReview
          : countReview // ignore: cast_nullable_to_non_nullable
              as int?,
      shortProfile: freezed == shortProfile
          ? _value.shortProfile
          : shortProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      schedules: freezed == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<Schedule>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorImplCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$$DoctorImplCopyWith(
          _$DoctorImpl value, $Res Function(_$DoctorImpl) then) =
      __$$DoctorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? photo,
      double? rating,
      @JsonKey(name: 'count_patient') int? countPatient,
      @JsonKey(name: 'count_experience') int? countExperience,
      @JsonKey(name: 'count_review') int? countReview,
      @JsonKey(name: 'short_profile') String? shortProfile,
      List<Schedule>? schedules});
}

/// @nodoc
class __$$DoctorImplCopyWithImpl<$Res>
    extends _$DoctorCopyWithImpl<$Res, _$DoctorImpl>
    implements _$$DoctorImplCopyWith<$Res> {
  __$$DoctorImplCopyWithImpl(
      _$DoctorImpl _value, $Res Function(_$DoctorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photo = freezed,
    Object? rating = freezed,
    Object? countPatient = freezed,
    Object? countExperience = freezed,
    Object? countReview = freezed,
    Object? shortProfile = freezed,
    Object? schedules = freezed,
  }) {
    return _then(_$DoctorImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      countPatient: freezed == countPatient
          ? _value.countPatient
          : countPatient // ignore: cast_nullable_to_non_nullable
              as int?,
      countExperience: freezed == countExperience
          ? _value.countExperience
          : countExperience // ignore: cast_nullable_to_non_nullable
              as int?,
      countReview: freezed == countReview
          ? _value.countReview
          : countReview // ignore: cast_nullable_to_non_nullable
              as int?,
      shortProfile: freezed == shortProfile
          ? _value.shortProfile
          : shortProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      schedules: freezed == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<Schedule>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorImpl implements _Doctor {
  _$DoctorImpl(
      {this.id,
      this.name,
      this.photo,
      this.rating,
      @JsonKey(name: 'count_patient') this.countPatient,
      @JsonKey(name: 'count_experience') this.countExperience,
      @JsonKey(name: 'count_review') this.countReview,
      @JsonKey(name: 'short_profile') this.shortProfile,
      final List<Schedule>? schedules})
      : _schedules = schedules;

  factory _$DoctorImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? photo;
  @override
  final double? rating;
  @override
  @JsonKey(name: 'count_patient')
  final int? countPatient;
  @override
  @JsonKey(name: 'count_experience')
  final int? countExperience;
  @override
  @JsonKey(name: 'count_review')
  final int? countReview;
  @override
  @JsonKey(name: 'short_profile')
  final String? shortProfile;
  final List<Schedule>? _schedules;
  @override
  List<Schedule>? get schedules {
    final value = _schedules;
    if (value == null) return null;
    if (_schedules is EqualUnmodifiableListView) return _schedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Doctor(id: $id, name: $name, photo: $photo, rating: $rating, countPatient: $countPatient, countExperience: $countExperience, countReview: $countReview, shortProfile: $shortProfile, schedules: $schedules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.countPatient, countPatient) ||
                other.countPatient == countPatient) &&
            (identical(other.countExperience, countExperience) ||
                other.countExperience == countExperience) &&
            (identical(other.countReview, countReview) ||
                other.countReview == countReview) &&
            (identical(other.shortProfile, shortProfile) ||
                other.shortProfile == shortProfile) &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      photo,
      rating,
      countPatient,
      countExperience,
      countReview,
      shortProfile,
      const DeepCollectionEquality().hash(_schedules));

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorImplCopyWith<_$DoctorImpl> get copyWith =>
      __$$DoctorImplCopyWithImpl<_$DoctorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorImplToJson(
      this,
    );
  }
}

abstract class _Doctor implements Doctor {
  factory _Doctor(
      {final int? id,
      final String? name,
      final String? photo,
      final double? rating,
      @JsonKey(name: 'count_patient') final int? countPatient,
      @JsonKey(name: 'count_experience') final int? countExperience,
      @JsonKey(name: 'count_review') final int? countReview,
      @JsonKey(name: 'short_profile') final String? shortProfile,
      final List<Schedule>? schedules}) = _$DoctorImpl;

  factory _Doctor.fromJson(Map<String, dynamic> json) = _$DoctorImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get photo;
  @override
  double? get rating;
  @override
  @JsonKey(name: 'count_patient')
  int? get countPatient;
  @override
  @JsonKey(name: 'count_experience')
  int? get countExperience;
  @override
  @JsonKey(name: 'count_review')
  int? get countReview;
  @override
  @JsonKey(name: 'short_profile')
  String? get shortProfile;
  @override
  List<Schedule>? get schedules;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorImplCopyWith<_$DoctorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  int? get id => throw _privateConstructorUsedError;
  int? get doctorId => throw _privateConstructorUsedError;
  int? get weekday => throw _privateConstructorUsedError;
  List<int>? get time => throw _privateConstructorUsedError;
  int? get quota => throw _privateConstructorUsedError;
  int? get booked => throw _privateConstructorUsedError;

  /// Serializes this Schedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {int? id,
      int? doctorId,
      int? weekday,
      List<int>? time,
      int? quota,
      int? booked});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? doctorId = freezed,
    Object? weekday = freezed,
    Object? time = freezed,
    Object? quota = freezed,
    Object? booked = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int?,
      weekday: freezed == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as int?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      quota: freezed == quota
          ? _value.quota
          : quota // ignore: cast_nullable_to_non_nullable
              as int?,
      booked: freezed == booked
          ? _value.booked
          : booked // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleImplCopyWith<$Res>
    implements $ScheduleCopyWith<$Res> {
  factory _$$ScheduleImplCopyWith(
          _$ScheduleImpl value, $Res Function(_$ScheduleImpl) then) =
      __$$ScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? doctorId,
      int? weekday,
      List<int>? time,
      int? quota,
      int? booked});
}

/// @nodoc
class __$$ScheduleImplCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$ScheduleImpl>
    implements _$$ScheduleImplCopyWith<$Res> {
  __$$ScheduleImplCopyWithImpl(
      _$ScheduleImpl _value, $Res Function(_$ScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? doctorId = freezed,
    Object? weekday = freezed,
    Object? time = freezed,
    Object? quota = freezed,
    Object? booked = freezed,
  }) {
    return _then(_$ScheduleImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int?,
      weekday: freezed == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as int?,
      time: freezed == time
          ? _value._time
          : time // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      quota: freezed == quota
          ? _value.quota
          : quota // ignore: cast_nullable_to_non_nullable
              as int?,
      booked: freezed == booked
          ? _value.booked
          : booked // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleImpl implements _Schedule {
  _$ScheduleImpl(
      {this.id,
      this.doctorId,
      this.weekday,
      final List<int>? time,
      this.quota,
      this.booked})
      : _time = time;

  factory _$ScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleImplFromJson(json);

  @override
  final int? id;
  @override
  final int? doctorId;
  @override
  final int? weekday;
  final List<int>? _time;
  @override
  List<int>? get time {
    final value = _time;
    if (value == null) return null;
    if (_time is EqualUnmodifiableListView) return _time;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? quota;
  @override
  final int? booked;

  @override
  String toString() {
    return 'Schedule(id: $id, doctorId: $doctorId, weekday: $weekday, time: $time, quota: $quota, booked: $booked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            const DeepCollectionEquality().equals(other._time, _time) &&
            (identical(other.quota, quota) || other.quota == quota) &&
            (identical(other.booked, booked) || other.booked == booked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, doctorId, weekday,
      const DeepCollectionEquality().hash(_time), quota, booked);

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      __$$ScheduleImplCopyWithImpl<_$ScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleImplToJson(
      this,
    );
  }
}

abstract class _Schedule implements Schedule {
  factory _Schedule(
      {final int? id,
      final int? doctorId,
      final int? weekday,
      final List<int>? time,
      final int? quota,
      final int? booked}) = _$ScheduleImpl;

  factory _Schedule.fromJson(Map<String, dynamic> json) =
      _$ScheduleImpl.fromJson;

  @override
  int? get id;
  @override
  int? get doctorId;
  @override
  int? get weekday;
  @override
  List<int>? get time;
  @override
  int? get quota;
  @override
  int? get booked;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  int? get id => throw _privateConstructorUsedError;
  int? get doctorId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {int? id,
      int? doctorId,
      String? name,
      double? rating,
      String? comment,
      String? avatar});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? doctorId = freezed,
    Object? name = freezed,
    Object? rating = freezed,
    Object? comment = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? doctorId,
      String? name,
      double? rating,
      String? comment,
      String? avatar});
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? doctorId = freezed,
    Object? name = freezed,
    Object? rating = freezed,
    Object? comment = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_$ReviewImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  _$ReviewImpl(
      {this.id,
      this.doctorId,
      this.name,
      this.rating,
      this.comment,
      this.avatar});

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  final int? id;
  @override
  final int? doctorId;
  @override
  final String? name;
  @override
  final double? rating;
  @override
  final String? comment;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'Review(id: $id, doctorId: $doctorId, name: $name, rating: $rating, comment: $comment, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, doctorId, name, rating, comment, avatar);

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  factory _Review(
      {final int? id,
      final int? doctorId,
      final String? name,
      final double? rating,
      final String? comment,
      final String? avatar}) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  int? get id;
  @override
  int? get doctorId;
  @override
  String? get name;
  @override
  double? get rating;
  @override
  String? get comment;
  @override
  String? get avatar;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
