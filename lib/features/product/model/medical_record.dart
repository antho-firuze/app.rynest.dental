import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_record.freezed.dart';
part 'medical_record.g.dart';

@freezed
class MedicalRecord with _$MedicalRecord {

  factory MedicalRecord({
    String? treatment,
    DateTime? date,
    String? doctor,
    List<int>? location,
    String? diagnosis,
  }) = _MedicalRecord;

  factory MedicalRecord.fromJson(Map<String, dynamic> json) => _$MedicalRecordFromJson(json);
}