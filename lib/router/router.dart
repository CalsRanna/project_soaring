import 'package:auto_route/auto_route.dart';
import 'package:project_soaring/router/router.gr.dart';

@AutoRouterConfig()
class ProjectSoaringRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(initial: true, page: HomeRoute.page),
      AutoRoute(page: CombatRoute.page),
      AutoRoute(page: ExerciseRoute.page),
    ];
  }
}

final router = ProjectSoaringRouter();
