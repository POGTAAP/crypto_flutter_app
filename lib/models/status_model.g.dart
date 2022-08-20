// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusModel _$StatusModelFromJson(Map<String, dynamic> json) => StatusModel(
      json['timestamp'] as String,
      json['error_code'] as int,
      json['error_message'] as String?,
      json['elapsed'] as int,
      json['credit_count'] as int,
      json['notice'] as String?,
      json['total_count'] as int,
    );

Map<String, dynamic> _$StatusModelToJson(StatusModel instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'error_code': instance.errorCode,
      'error_message': instance.errorMessage,
      'elapsed': instance.elapsed,
      'credit_count': instance.creditCount,
      'notice': instance.notice,
      'total_count': instance.totalCount,
    };
