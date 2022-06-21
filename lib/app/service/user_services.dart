

import 'package:dumbdumb_flutter_app/app/assets/constants.dart';
import 'package:dumbdumb_flutter_app/app/model/network/my_response.dart';

import 'base_services.dart';

class UserServices extends BaseServices {

  /// DEMO PURPOSE: call login API
  /// Sample API call to login
  Future<MyResponse> login(String username, String password) async {
    String path = '${apiUrl()}/account/login';
    var postBody = {
      'username': username,
      'password': password
    };
    return callAPI(HttpRequestType.POST, path, postBody: postBody);
  }

  /// DEMO PURPOSE: call getProfile API without a valid accessToken
  /// Sample API call to test forbidden user access
  Future<MyResponse> getProfile() async {
    String path = '${apiUrl()}/Account/profile';
    return callAPI(HttpRequestType.GET, path);
  }
}