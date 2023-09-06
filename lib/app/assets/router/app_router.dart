
import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_app_screens.dart';
import 'package:dumbdumb_flutter_app/app/assets/exporter/importer_routing.dart';

class AppRouter {
  static String home = '/';
  static String login = '/login';
}

final GoRouter router = GoRouter(routes: [
  GoRoute(path: AppRouter.home, builder: (context, state) => const GetProfilePage()),
  GoRoute(path: AppRouter.login, builder: (context, state) => const LoginPage())
]);
