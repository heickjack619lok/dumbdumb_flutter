
import 'package:flutter/material.dart';
import 'package:dumbdumb_flutter_app/app/model/error_model.dart';
import 'package:dumbdumb_flutter_app/app/utils/util.dart';
import 'package:dumbdumb_flutter_app/l10n/l10n.dart';

/// A base class to unified all the required common functions and widgets
/// Inherited the StatefulWidget that allow changes to be made when user interact with it
/// more info: https://docs.flutter.dev/development/ui/interactive#stateful-and-stateless-widgets
abstract class BaseStatefulPage extends StatefulWidget { }

/// A basic state that include common widgets and Ui logic handling
abstract class BaseStatefulState<Page extends BaseStatefulPage> extends State<Page> {

  AppBar? appbar() => null;
  Widget body();
  Widget floatingActionButton();
  ErrorModel urgentError();

  /// Each Page are meant to be build with a [Scaffold] structure
  /// include with [AppBar], [Body], [FloatingActionButton]
  /// Additional handling for [urgentError] is included here,
  /// so that all inheriting classes would not needed to handle it repeatedly.
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(urgentError().forbidden()) {
        final actions = List<Widget>.empty(growable: true)
          ..add(WidgetUtil.getDialogButton(l10n.textOk, () {
            Navigator.of(context, rootNavigator: true).pop();
          }));
        WidgetUtil.showAlertDialog(context, l10n.errorTitle, urgentError().getErrorMessage(), actions, false);
      }
    });
    return Scaffold(
      appBar: appbar(),
      body: body(),
      floatingActionButton: floatingActionButton(),
      resizeToAvoidBottomInset: true,
    );
  }
}