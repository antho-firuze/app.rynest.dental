// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicalRecordImpl _$$MedicalRecordImplFromJson(Map<String, dynamic> json) =>
    _$MedicalRecordImpl(
      treatment: json['treatment'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      doctor: json['doctor'] as String?,
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      diagnosis: json['diagnosis'] as String?,
    );

Map<String, dynamic> _$$MedicalRecordImplToJson(_$MedicalRecordImpl instance) =>
    <String, dynamic>{
      'treatment': instance.treatment,
      'date': instance.date?.toIso8601String(),
      'doctor': instance.doctor,
      'location': instance.location,
      'diagnosis': instance.diagnosis,
    };
