import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_soaring/page/backpack.dart';
import 'package:project_soaring/page/character.dart';
import 'package:project_soaring/page/dungeon/dungeon.dart';
import 'package:project_soaring/page/equipment.dart';
import 'package:project_soaring/page/launcher.dart';
import 'package:project_soaring/page/recast.dart';
import 'package:project_soaring/page/spawn.dart';

part 'router.g.dart';

final router = GoRouter(routes: $appRoutes);

@TypedGoRoute<LauncherPageRoute>(path: '/')
class LauncherPageRoute extends GoRouteData {
  const LauncherPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LauncherPage();
  }
}

@TypedGoRoute<SpawnPageRoute>(path: '/spawn')
class SpawnPageRoute extends GoRouteData {
  const SpawnPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SpawnPage();
  }
}

@TypedGoRoute<CharacterPageRoute>(path: '/character')
class CharacterPageRoute extends GoRouteData {
  const CharacterPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CharacterPage();
  }
}

@TypedGoRoute<BackpackPageRoute>(path: '/backpack')
class BackpackPageRoute extends GoRouteData {
  const BackpackPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BackpackPage();
  }
}

@TypedGoRoute<DungeonPageRoute>(path: '/dungeon')
class DungeonPageRoute extends GoRouteData {
  const DungeonPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DungeonPage();
  }
}

@TypedGoRoute<EquipmentPageRoute>(path: '/equipment')
class EquipmentPageRoute extends GoRouteData {
  const EquipmentPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EquipmentPage();
  }
}

@TypedGoRoute<RecastPageRoute>(path: '/recast')
class RecastPageRoute extends GoRouteData {
  const RecastPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RecastPage();
  }
}
