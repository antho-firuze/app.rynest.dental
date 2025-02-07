// ignore_for_file: invalid_annotation_target

import 'package:dental/utils/json_converter_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  factory Profile({
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'member_id') int? memberId,
    @Default('') String identifier,
    @Default('') String name,
    @JsonKey(name: 'full_name') @Default('') String fullName,
    @Default('') String email,
    @Default('') String phone,
    @JsonKey(name: 'is_phone_verified') @JsonBoolConverter() @Default(false) bool isPhoneVerified,
    @JsonKey(name: 'is_email_verified') @JsonBoolConverter() @Default(false) bool isEmailVerified,
    @Default('') String address,
    @Default('') String photo,
    @JsonKey(name: 'passport_no') String? passportNo,
    String? gender,
    String? placeOfBirth,
    DateTime? dateOfBirth,
    double? weightKg,
    double? heightCm,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}
