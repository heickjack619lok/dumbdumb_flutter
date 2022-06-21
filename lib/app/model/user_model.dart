class UserModel {

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
    id = getStringValue(json['id']);
    email = getStringValue(json['email']);
    icNumber = getStringValue(json['icNumber']);
    accessToken = getStringValue(json['auth_token']);
    refreshToken = getStringValue(json['refresh_token']);
    fullName = getStringValue(json['fullName']);
    phoneNumber = getStringValue(json['phoneNumber']);
    createdDate = getStringValue(json['createdDate']);
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

  String getStringValue(dynamic? jsonValue) =>
      jsonValue != null ? jsonValue.toString() : '';

  String? id;
  int? gender;
  String? email;
  String? icNumber;
  String? fullName;
  String? createdDate;
  String? phoneNumber;
  String? accessToken;
  String? refreshToken;
}
