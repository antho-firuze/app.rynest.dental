// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorImpl _$$DoctorImplFromJson(Map<String, dynamic> json) => _$DoctorImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      countPatient: (json['count_patient'] as num?)?.toInt(),
      countExperience: (json['count_experience'] as num?)?.toInt(),
      countReview: (json['count_review'] as num?)?.toInt(),
      shortProfile: json['short_profile'] as String?,
      schedules: (json['schedules'] as List<dynamic>?)
          ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DoctorImplToJson(_$DoctorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'rating': instance.rating,
      'count_patient': instance.countPatient,
      'count_experience': instance.countExperience,
      'count_review': instance.countReview,
      'short_profile': instance.shortProfile,
      'schedules': instance.schedules,
    };

_$ScheduleImpl _$$ScheduleImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleImpl(
      id: (json['id'] as num?)?.toInt(),
      doctorId: (json['doctorId'] as num?)?.toInt(),
      weekday: (json['weekday'] as num?)?.toInt(),
      time: (json['time'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      quota: (json['quota'] as num?)?.toInt(),
      booked: (json['booked'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ScheduleImplToJson(_$ScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctorId': instance.doctorId,
      'weekday': instance.weekday,
      'time': instance.time,
      'quota': instance.quota,
      'booked': instance.booked,
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      id: (json['id'] as num?)?.toInt(),
      doctorId: (json['doctorId'] as num?)?.toInt(),
      name: json['name'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      comment: json['comment'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctorId': instance.doctorId,
      'name': instance.name,
      'rating': instance.rating,
      'comment': instance.comment,
      'avatar': instance.avatar,
    };
