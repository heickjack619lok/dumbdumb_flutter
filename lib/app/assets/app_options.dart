import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_structural_component.dart';

/// Configuration separated by different environment
/// Add your respective [apiEndpoint] and more configuration here
/// Call/perform initialization action in [starter_handler.init] method.
class DevelopmentConstant {
  static const String apiEndpoint = 'YOUR API ENDPOINT';
}

class StagingConstant {
  static const String apiEndpoint = 'YOUR API ENDPOINT';
}

class ProductionConstant {
  static const String apiEndpoint = 'YOUR API ENDPOINT';
}

/// Define the type of environment supported in this project
enum EnvironmentType { production, staging, development }

/// Declaring all the ViewModel that to be use in Provider + ChangeNotifier
/// All registered providers here will be set into [MultiProvider] in [app.dart]
/// All registered providers are configured at the deepest layer of inheritance widget
/// ensuring any screen in this app will be able to access to the providers
List<SingleChildWidget> providerAssets() => [
      ChangeNotifierProvider.value(value: LoginViewModel()),
      ChangeNotifierProvider.value(value: BaseViewModel()),
      ChangeNotifierProvider.value(value: AppViewModel())
    ];
