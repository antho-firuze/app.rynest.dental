import 'package:freezed_annotation/freezed_annotation.dart';

part 'practice_hour.freezed.dart';
part 'practice_hour.g.dart';

@freezed
class PracticeHour with _$PracticeHour {

  factory PracticeHour({
    int? time,
  }) = _PracticeHour;

  factory PracticeHour.fromJson(Map<String, dynamic> json) => _$PracticeHourFromJson(json);
}