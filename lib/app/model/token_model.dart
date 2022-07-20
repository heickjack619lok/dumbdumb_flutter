import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

@freezed
class TokenModel with _$TokenModel {
  factory TokenModel({
    String? accessToken,
    String? refreshToken,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}
