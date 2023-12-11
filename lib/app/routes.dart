import 'package:auto_route/auto_route.dart';
import 'package:note_muse/app/routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/home', initial: true),
        AutoRoute(page: WorkspaceRoute.page, path: '/workspace'),
        AutoRoute(page: EditWorkspaceRoute.page, path: '/editWorkspace'),
      ];
}
