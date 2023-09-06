import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_structural_component.dart';

class AppViewModel extends BaseViewModel {
  void changeLanguage(String language) async {
    notify(MyResponse.loading());

    await AppConfigRepository().selectLanguage(language);

    notify(MyResponse.complete(UpdateLanguageModel(language)));
  }
}
