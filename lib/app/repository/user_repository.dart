
import 'package:dumbdumb_flutter_app/app/model/network/my_response.dart';
import '../service/user_services.dart';

/// Repository class is defining the business logic for accessing data source,
/// eg:
/// 1. getting data from multiple source and compiled as one data type before passing back to ViewModel.
/// 2. decide when to return CacheData or Actual Realtime ServerData
/// 3. And many more
class UserRepository {

  UserServices _userServices = UserServices();

  Future<MyResponse> login(String username, String password) async {
    return await _userServices.login(username, password);
  }

  Future<MyResponse> getProfile() async {
    return await _userServices.getProfile();
  }
}