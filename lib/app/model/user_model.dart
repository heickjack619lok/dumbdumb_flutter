import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_general.dart';

class UserModel {
  String? id;
  int? gender;
  String? email;
  String? icNumber;
  String? fullName;
  String? createdDate;
  String? phoneNumber;
  String? accessToken;
  String? refreshToken;

  UserModel(
      {this.id,
      this.gender,
      this.email,
      this.fullName,
      this.createdDate,
      this.phoneNumber,
      this.accessToken,
      this.refreshToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = DynamicParsing(json['id']).parseString();
    email = DynamicParsing(json['email']).parseString();
    icNumber = DynamicParsing(json['icNumber']).parseString();
    accessToken = DynamicParsing(json['auth_token']).parseString();
    refreshToken = DynamicParsing(json['refresh_token']).parseString();
    fullName = DynamicParsing(json['fullName']).parseString();
    phoneNumber = DynamicParsing(json['phoneNumber']).parseString();
    createdDate = DynamicParsing(json['createdDate']).parseString();
    gender = int.tryParse(json['gender'].toString()) ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['gender'] = gender;
    data['icNumber'] = icNumber;
    data['fullName'] = fullName;
    data['auth_token'] = accessToken;
    data['createdDate'] = createdDate;
    data['phoneNumber'] = phoneNumber;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
