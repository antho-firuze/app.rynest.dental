// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      id: (json['id'] as num?)?.toInt(),
      message: json['message'] as String?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      itsMe: json['its_me'] as bool? ?? true,
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'time': instance.time?.toIso8601String(),
      'its_me': instance.itsMe,
    };
