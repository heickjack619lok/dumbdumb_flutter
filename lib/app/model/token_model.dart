import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_general.dart';

class TokenModel {
  String? accessToken;
  String? refreshToken;

  TokenModel({this.accessToken, this.refreshToken});

  TokenModel.fromJson(Map<String, dynamic> json) {
    accessToken = DynamicParsing(json['auth_token']).parseString();
    refreshToken = DynamicParsing(json['refresh_token']).parseString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['auth_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
