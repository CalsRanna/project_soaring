// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $launcherPageRoute,
      $spawnPageRoute,
      $characterPageRoute,
      $backpackPageRoute,
      $areasPageRoute,
      $dungeonsPageRoute,
      $dungeonPageRoute,
      $equipmentPageRoute,
      $recastPageRoute,
      $combatPageRoute,
      $trialsPageRoute,
      $combatDemoPageRoute,
    ];

RouteBase get $launcherPageRoute => GoRouteData.$route(
      path: '/',
      factory: $LauncherPageRouteExtension._fromState,
    );

extension $LauncherPageRouteExtension on LauncherPageRoute {
  static LauncherPageRoute _fromState(GoRouterState state) =>
      const LauncherPageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $spawnPageRoute => GoRouteData.$route(
      path: '/spawn',
      factory: $SpawnPageRouteExtension._fromState,
    );

extension $SpawnPageRouteExtension on SpawnPageRoute {
  static SpawnPageRoute _fromState(GoRouterState state) =>
      const SpawnPageRoute();

  String get location => GoRouteData.$location(
        '/spawn',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $characterPageRoute => GoRouteData.$route(
      path: '/character',
      factory: $CharacterPageRouteExtension._fromState,
    );

extension $CharacterPageRouteExtension on CharacterPageRoute {
  static CharacterPageRoute _fromState(GoRouterState state) =>
      const CharacterPageRoute();

  String get location => GoRouteData.$location(
        '/character',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $backpackPageRoute => GoRouteData.$route(
      path: '/backpack',
      factory: $BackpackPageRouteExtension._fromState,
    );

extension $BackpackPageRouteExtension on BackpackPageRoute {
  static BackpackPageRoute _fromState(GoRouterState state) =>
      const BackpackPageRoute();

  String get location => GoRouteData.$location(
        '/backpack',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $areasPageRoute => GoRouteData.$route(
      path: '/areas',
      factory: $AreasPageRouteExtension._fromState,
    );

extension $AreasPageRouteExtension on AreasPageRoute {
  static AreasPageRoute _fromState(GoRouterState state) =>
      const AreasPageRoute();

  String get location => GoRouteData.$location(
        '/areas',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $dungeonsPageRoute => GoRouteData.$route(
      path: '/dungeons',
      factory: $DungeonsPageRouteExtension._fromState,
    );

extension $DungeonsPageRouteExtension on DungeonsPageRoute {
  static DungeonsPageRoute _fromState(GoRouterState state) =>
      const DungeonsPageRoute();

  String get location => GoRouteData.$location(
        '/dungeons',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $dungeonPageRoute => GoRouteData.$route(
      path: '/dungeon',
      factory: $DungeonPageRouteExtension._fromState,
    );

extension $DungeonPageRouteExtension on DungeonPageRoute {
  static DungeonPageRoute _fromState(GoRouterState state) => DungeonPageRoute(
        id: int.parse(state.uri.queryParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/dungeon',
        queryParams: {
          'id': id.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $equipmentPageRoute => GoRouteData.$route(
      path: '/equipment',
      factory: $EquipmentPageRouteExtension._fromState,
    );

extension $EquipmentPageRouteExtension on EquipmentPageRoute {
  static EquipmentPageRoute _fromState(GoRouterState state) =>
      const EquipmentPageRoute();

  String get location => GoRouteData.$location(
        '/equipment',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $recastPageRoute => GoRouteData.$route(
      path: '/recast',
      factory: $RecastPageRouteExtension._fromState,
    );

extension $RecastPageRouteExtension on RecastPageRoute {
  static RecastPageRoute _fromState(GoRouterState state) =>
      const RecastPageRoute();

  String get location => GoRouteData.$location(
        '/recast',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $combatPageRoute => GoRouteData.$route(
      path: '/combat',
      factory: $CombatPageRouteExtension._fromState,
    );

extension $CombatPageRouteExtension on CombatPageRoute {
  static CombatPageRoute _fromState(GoRouterState state) =>
      const CombatPageRoute();

  String get location => GoRouteData.$location(
        '/combat',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $trialsPageRoute => GoRouteData.$route(
      path: '/trials',
      factory: $TrialsPageRouteExtension._fromState,
    );

extension $TrialsPageRouteExtension on TrialsPageRoute {
  static TrialsPageRoute _fromState(GoRouterState state) =>
      const TrialsPageRoute();

  String get location => GoRouteData.$location(
        '/trials',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $combatDemoPageRoute => GoRouteData.$route(
      path: '/combat-demo',
      factory: $CombatDemoPageRouteExtension._fromState,
    );

extension $CombatDemoPageRouteExtension on CombatDemoPageRoute {
  static CombatDemoPageRoute _fromState(GoRouterState state) =>
      const CombatDemoPageRoute();

  String get location => GoRouteData.$location(
        '/combat-demo',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
