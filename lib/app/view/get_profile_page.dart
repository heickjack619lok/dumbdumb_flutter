

import 'package:flutter/material.dart';
import 'package:dumbdumb_flutter_app/app/model/error_model.dart';
import 'package:dumbdumb_flutter_app/app/view/base_stateless_page.dart';
import 'package:provider/provider.dart';

import '../model/network/my_response.dart';
import '../viewmodel/login_view_model.dart';

class GetProfilePage extends BaseStatelessPage {

  late ErrorModel urgentErrorObservable;

  Widget userInfoText(MyResponse response) {
    final theme = Theme.of(context);

    switch(response.status) {
      case ResponseStatus.LOADING: return Text("Loading data...", style: theme.textTheme.titleMedium);
      case ResponseStatus.ERROR: return Text(response.error, style: theme.textTheme.bodySmall);
      case ResponseStatus.COMPLETE: return Text(response.data, style: theme.textTheme.bodySmall);
      default: return Text("Click the get profile button at the bottom to start", style: theme.textTheme.subtitle1);
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
      onPressed: () => context.read<LoginViewModel>().getProfile(),
      child: const Icon(Icons.person_add),
    );
  }

  @override
  ErrorModel urgentError() => urgentErrorObservable;
}