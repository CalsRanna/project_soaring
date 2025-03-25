import 'package:auto_route/auto_route.dart';
import 'package:project_soaring/router/router.gr.dart';

@AutoRouterConfig()
class SoaringRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LauncherRoute.page, initial: true),
    AutoRoute(page: SpawnRoute.page),
  ];
}

final soaringRouter = SoaringRouter();
