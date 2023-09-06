import 'dart:async';

import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_general.dart';
import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_routing.dart';

class CustomRouteParser extends GoRouteInformationParser {
  CustomRouteParser({required super.configuration, required super.onParserException});

  @override
  Future<RouteMatchList> parseRouteInformationWithDependencies(
      RouteInformation routeInformation, BuildContext context) {
    late final RouteMatchList initialMatches;

    late RouteInformation deeplinkRouteInformation =
        RouteInformation(location: routeInformation.location, state: routeInformation.state);

    /// This is where you get the deeplink/redirect URL from browser or anywhere else
    // var deeplink = routeInformation.location;

    initialMatches = configuration.findMatch(deeplinkRouteInformation.location!, extra: deeplinkRouteInformation.state);

    /// This is when there is no matched route available,
    /// and therefore you may add custom redirect action here
    Future<RouteMatchList> processRedirectorResult(RouteMatchList matches) {
      /// This sample is returning to route == 'home' when the deeplink route is not matching any of available path
      if (matches.isEmpty) {
        return SynchronousFuture<RouteMatchList>(
            configuration.findMatch(AppRouter.home, extra: deeplinkRouteInformation.state));
      }
      /// Or system will return the matched route
      return SynchronousFuture<RouteMatchList>(matches);
    }

    return processRedirectorResult(initialMatches);
  }
}
