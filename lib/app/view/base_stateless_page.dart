
import 'package:flutter/material.dart';
import 'package:dumbdumb_flutter_app/l10n/l10n.dart';
import 'package:provider/provider.dart';

import '../model/error_model.dart';
import '../utils/util.dart';
import '../viewmodel/login_view_model.dart';

/// A base class to unified all the required common functions and widgets
/// Inherited the StatelessWidget that does not required changes and user interaction
/// more info: https://docs.flutter.dev/development/ui/interactive#stateful-and-stateless-widgets
abstract class BaseStatelessPage extends StatelessWidget {

  AppBar? appbar() => null;
  Widget body();
  Widget floatingActionButton();
  ErrorModel urgentError();
  late BuildContext context;

  /// Each Page are meant to be build with a [Scaffold] structure
  /// include with [AppBar], [Body], [FloatingActionButton]
  /// Additional handling for [urgentError] is included here,
  /// so that all inheriting classes would not needed to handle it repeatedly.
  @override
  Widget build(BuildContext context) {
    this.context = context;
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