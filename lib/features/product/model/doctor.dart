// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor.freezed.dart';
part 'doctor.g.dart';

@freezed
class Doctor with _$Doctor {

  factory Doctor({
    int? id,
    String? name,
    String? photo,
    double? rating,
    @JsonKey(name: 'count_patient') int? countPatient,
    @JsonKey(name: 'count_experience') int? countExperience,
    @JsonKey(name: 'count_review') int? countReview,
    @JsonKey(name: 'short_profile') String? shortProfile,
    List<Schedule>? schedules,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}

@freezed
class Schedule with _$Schedule {

  factory Schedule({
    int? id,
    int? doctorId,
    int? weekday,
    List<int>? time,
    int? quota,
    int? booked,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
}

@freezed
class Review with _$Review {

  factory Review({
    int? id,
    int? doctorId,
    String? name,
    double? rating,
    String? comment,
    String? avatar,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}