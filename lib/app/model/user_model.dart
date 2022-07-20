import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    String? id,
    int? gender,
    String? email,
    String? icNumber,
    String? fullName,
    String? createdDate,
    String? phoneNumber,
    String? accessToken,
    String? refreshToken,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
