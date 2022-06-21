import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../viewmodel/base_view_model.dart';
import '../viewmodel/login_view_model.dart';

/// Configuration separated by different environment
/// Add your respective [API_ENDPOINT] and more configuration here
/// Call/perform initialization action in [starter_handler.init] method.
class DevelopmentConstant {
  static const String API_ENDPOINT = 'YOUR API ENDPOINT';
}

class StagingConstant {
  static const String API_ENDPOINT = 'YOUR API ENDPOINT';
}

class ProductionConstant {
  static const String API_ENDPOINT = 'YOUR API ENDPOINT';
}

/// Define the type of environment supported in this project
enum EnvironmentType { PRODUCTION, STAGING, DEVELOPMENT }

/// Declaring all the ViewModel that to be use in Provider + ChangeNotifier
/// All registered providers here will be set into [MultiProvider] in [app.dart]
/// All registered providers are configured at the deepest layer of inheritance widget
/// ensuring any screen in this app will be able to access to the providers
List<SingleChildWidget> providerAssets() => [
  ChangeNotifierProvider.value(value: LoginViewModel()),
  ChangeNotifierProvider.value(value: BaseViewModel())
];