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
    // ignore: invalid_annotation_target
    @JsonKey(name: 'createdDate') String? createdDateString,
    String? phoneNumber,
    String? accessToken,
    String? refreshToken,
  }) = _UserModel;

  UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  DateTime? get createdDate =>
      createdDateString != null ? DateTime.tryParse(createdDateString!) : null;
}
