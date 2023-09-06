import '../assets/exporter/importer_app_screens.dart';
import '../assets/exporter/importer_app_structural_component.dart';
import '../assets/exporter/importer_app_general.dart';

class GetProfilePage extends BaseStatefulPage {
  const GetProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _GetProfilePageState();
}

class _GetProfilePageState extends BaseStatefulState<GetProfilePage> {
  ErrorModel? urgentErrorObservable;

  Widget userInfoText(MyResponse response) {
    final theme = Theme.of(context);

    switch (response.status) {
      case ResponseStatus.loading:
        return Text("Loading data...", style: theme.textTheme.titleMedium);
      case ResponseStatus.error:
        return Text(response.error.toString(), style: theme.textTheme.bodySmall);
      case ResponseStatus.complete:
        return Text(response.data, style: theme.textTheme.bodySmall);
      default:
        return Text("Click the get profile button at the bottom to start", style: theme.textTheme.titleMedium);
    }
  }

  @override
  Widget body() {
    urgentErrorObservable = context.watch<LoginViewModel>().urgentError;
    MyResponse myResponse = context.watch<LoginViewModel>().response;
    return Center(child: userInfoText(myResponse));
  }

  @override
  Widget floatingActionButton() {
    return FloatingActionButton(
        onPressed: () => context.read<LoginViewModel>().getProfile(), child: const Icon(Icons.person_add));
  }

  @override
  ErrorModel? urgentError() => urgentErrorObservable;
}
