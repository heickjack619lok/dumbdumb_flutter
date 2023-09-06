
import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_general.dart';
import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_structural_component.dart';

class AppConfigRepository {

  Future<MyResponse> selectLanguage(String newLang) async {
    SharedPreferenceHandler.putLanguage(newLang);
    /// A delayed of 1 seconds to simulate the API call waiting time
    /// May change this in actual implementation to API call and etc
    ///TODO: Update change language detail action
    await Future.delayed(const Duration(seconds: 1));
    return MyResponse.complete(newLang);
  }
}