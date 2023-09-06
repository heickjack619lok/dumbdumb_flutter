// Copyright (c) 2023, DumbDumb
// https://dumbdumb.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_general.dart';
import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_structural_component.dart';
import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_routing.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: providerAssets(), child: const AppWrapper());
  }
}

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<StatefulWidget> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  String lastLanguage = SharedPreferenceHandler.getLanguage();

  @override
  Widget build(BuildContext context) {
    var languageResponse = context.watch<AppViewModel>().language;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (lastLanguage != languageResponse) {
        context.read<AppViewModel>().consumed();
        setState(() => lastLanguage = languageResponse);
      }
    });

    return MaterialApp.router(
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.0);
          checkDeviceType(context);
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: scale), child: child ?? const SizedBox());
        },
        color: Colors.transparent,
        theme: ThemeData(
            fontFamily: 'Roboto',
            scaffoldBackgroundColor: Colors.white,
            primaryColorDark: CustomColors.primaryColorDark,
            primaryColor: CustomColors.primaryColor,
            appBarTheme: const AppBarTheme(
                color: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.light)),
            colorScheme: ColorScheme.fromSwatch(
                primaryColorDark: CustomColors.primaryColorDark, accentColor: CustomColors.colorAccent)),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale(languageResponse),
        routeInformationParser: CustomRouteParser(
            configuration: router.configuration, onParserException: (context, routeMatchList) => routeMatchList),
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate);
  }

  void checkDeviceType(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    // Determine if we should use mobile layout or not, 600 here is
    // a common breakpoint for a typical 7-inch tablet.
    // https://flutter.rocks/2018/01/28/implementing-adaptive-master-detail-layouts/
    var kTabletBreakpoint = 600;
    if (shortestSide < kTabletBreakpoint) {
      SharedPreferenceHandler.putIsTablet(false);
    } else {
      SharedPreferenceHandler.putIsTablet(true);
    }
  }
}
