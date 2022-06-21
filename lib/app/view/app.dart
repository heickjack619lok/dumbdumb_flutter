// Copyright (c) 2022, DumbDumb
// https://dumbdumb.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dumbdumb_flutter_app/app/view/get_profile_page.dart';
import 'package:dumbdumb_flutter_app/app/view/login_page.dart';
import 'package:dumbdumb_flutter_app/l10n/l10n.dart';
import 'package:provider/provider.dart';

import '../assets/app_options.dart';
import '../utils/notification_handler.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var noti = await NotificationHandler.getInstance();
    });
    return MultiProvider(
      providers: providerAssets(),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: LoginPage(),
      ),
    );
  }
}
