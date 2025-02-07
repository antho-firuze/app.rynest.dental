import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility.freezed.dart';
part 'facility.g.dart';

@freezed
class Facility with _$Facility {

  factory Facility({
    String? title,
    String? image,
    String? content,
  }) = _Facility;

  factory Facility.fromJson(Map<String, dynamic> json) => _$FacilityFromJson(json);
}