// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:project_soaring/page/combat/combat_page.dart' as _i1;
import 'package:project_soaring/page/exercise/exercise_page.dart' as _i2;
import 'package:project_soaring/page/forge/forge_page.dart' as _i3;
import 'package:project_soaring/page/home/home_page.dart' as _i4;

/// generated route for
/// [_i1.CombatPage]
class CombatRoute extends _i5.PageRouteInfo<void> {
  const CombatRoute({List<_i5.PageRouteInfo>? children})
    : super(CombatRoute.name, initialChildren: children);

  static const String name = 'CombatRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.CombatPage();
    },
  );
}

/// generated route for
/// [_i2.ExercisePage]
class ExerciseRoute extends _i5.PageRouteInfo<void> {
  const ExerciseRoute({List<_i5.PageRouteInfo>? children})
    : super(ExerciseRoute.name, initialChildren: children);

  static const String name = 'ExerciseRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.ExercisePage();
    },
  );
}

/// generated route for
/// [_i3.ForgePage]
class ForgeRoute extends _i5.PageRouteInfo<void> {
  const ForgeRoute({List<_i5.PageRouteInfo>? children})
    : super(ForgeRoute.name, initialChildren: children);

  static const String name = 'ForgeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.ForgePage();
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}
