import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_structural_component.dart';

/// ViewModel class as a connector between View and Model,
/// separating View and Model to segregate business logic from UI,
/// by accepting all request from View and perform related request through Model Layer.
/// One ViewModel class may serve multiple View classes. (ensuring Extensibility and Maintainability)
class LoginViewModel extends BaseViewModel {
  Future<void> login(String username, String password) async {
    /// Calling inherited BaseViewModel.notify() method to "Loading" status
    notify(MyResponse.loading());

    /// Passing user request to Data Layer for validation/verification purpose
    response = await UserRepository().login(username, password);

    /// Calling inherited BaseViewModel.notify() method to update the result of user request
    notify(response);
  }

  Future<void> getProfile() async {
    /// Calling inherited BaseViewModel.notify() method to "Loading" status
    notify(MyResponse.loading());

    /// Passing user request to Data Layer for information request/access purpose
    response = await UserRepository().getProfile();

    /// Calling inherited BaseViewModel.notify() method to update the result of user request
    notify(response);
  }
}
