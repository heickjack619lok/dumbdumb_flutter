// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, lines_longer_than_80_chars, non_constant_identifier_names, require_trailing_commas

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ErrorModel _$$_ErrorModelFromJson(Map<String, dynamic> json) =>
    _$_ErrorModel(
      errorCode: json['errorCode'] as int?,
      errorMessage: json['errorMessage'] as String?,
      errorCodeDescription: json['errorCodeDescription'] as String?,
      error: json['error'] as String?,
      errorDescription: json['errorDescription'] as String?,
    );

Map<String, dynamic> _$$_ErrorModelToJson(_$_ErrorModel instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
      'errorCodeDescription': instance.errorCodeDescription,
      'error': instance.error,
      'errorDescription': instance.errorDescription,
    };
