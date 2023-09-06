import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_structural_component.dart';
import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_general.dart';
import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_routing.dart';

/// A base class to unified all the required common functions and widgets
/// Inherited the StatefulWidget that allow changes to be made when user interact with it
/// more info: https://docs.flutter.dev/development/ui/interactive#stateful-and-stateless-widgets
abstract class BaseStatefulPage extends StatefulWidget {
  const BaseStatefulPage({super.key});
}

/// A basic state that include common widgets and Ui logic handling
abstract class BaseStatefulState<Page extends BaseStatefulPage> extends State<Page> with WidgetsBindingObserver {
  /// Basic component helper
  AppBar? appbar() => null;

  Widget body();

  Widget? floatingActionButton() => null;

  /// Functional helper
  bool isLoading(status) => status == ResponseStatus.loading;

  ErrorModel? urgentError();

  /// Styling helper
  Size size() => MediaQuery.of(context).size;

  FlutterView flutterView() => View.of(context);

  double width() => size().width;

  double height() => size().height;

  double usableWidthWithoutPadding() => width() - EdgeInsets.zero.tabletMode(flutterView()).horizontal;

  Color backgroundColor() => ThemeData().scaffoldBackgroundColor;

  bool extendBodyBehindAppBar() => false;

  bool topSafeAreaEnabled() => true;

  var jailBroken = SharedPreferenceHandler.getRootDetectionJailBroken();
  var rootDetectionDialogShown = false;
  var accessDeniedDialogShown = false;
  final str = S.current;

  void processError(MyResponse response, {String? defaultErrorMessage}) {
    if (response.status == ResponseStatus.error &&
        response.error != null &&
        response.error is Map<String, dynamic> &&
        ErrorModel.fromJson(response.error).forbidden() == false) {
      ErrorModel error = ErrorModel.fromJson(response.error);
      WidgetUtil.showSnackBar(context, error.getErrorMessage() ?? (defaultErrorMessage ?? S.current.errorTitle));
    }
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.initState();
  }

  /// Each Page are meant to be build with a [Scaffold] structure
  /// include with [AppBar], [Body], [FloatingActionButton]
  /// Additional handling for [urgentError] is included here,
  /// so that all inheriting classes would not needed to handle it repeatedly.
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!rootDetectionDialogShown && jailBroken) {
        WidgetUtil.showAlertDialog(context, str.errorTitle, str.jailbrokenWarning, [], false);
        setState(() => rootDetectionDialogShown = true);
      }

      if (urgentError()?.forbidden() == true && !accessDeniedDialogShown) {
        final actions = List<Widget>.empty(growable: true)
          ..add(WidgetUtil.getDialogButton(str.textOk, () {
            SharedPreferenceHandler.logout();
            context.pop();
          }));
        setState(() => accessDeniedDialogShown = true);
        WidgetUtil.showAlertDialog(context, str.errorTitle, urgentError()?.getErrorMessage(), actions, false);
      }
    });

    return Scaffold(
        backgroundColor: backgroundColor(),
        extendBodyBehindAppBar: extendBodyBehindAppBar(),
        appBar: appbar(),
        body: SafeArea(
            left: false,
            right: false,
            top: topSafeAreaEnabled(),
            bottom: false,
            child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(), child: jailBroken ? jailBrokenWarning() : body())),
        floatingActionButton: floatingActionButton(),
        resizeToAvoidBottomInset: true);
  }

  Widget jailBrokenWarning() =>
      WillPopScope(child: Container(color: Colors.white), onWillPop: () async => Future<bool>.value(false));
}
