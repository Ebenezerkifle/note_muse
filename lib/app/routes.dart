import 'package:auto_route/auto_route.dart';
import 'package:note_muse/app/routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignInRoute.page,  initial: true),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: EditWorkspaceRoute.page),
      ];
}
