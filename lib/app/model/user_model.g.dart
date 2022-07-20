// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, lines_longer_than_80_chars, non_constant_identifier_names, require_trailing_commas

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String?,
      gender: json['gender'] as int?,
      email: json['email'] as String?,
      icNumber: json['icNumber'] as String?,
      fullName: json['fullName'] as String?,
      createdDateString: json['createdDate'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gender': instance.gender,
      'email': instance.email,
      'icNumber': instance.icNumber,
      'fullName': instance.fullName,
      'createdDate': instance.createdDateString,
      'phoneNumber': instance.phoneNumber,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
