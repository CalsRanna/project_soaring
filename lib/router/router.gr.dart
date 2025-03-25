// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:project_soaring/page/launcher.dart' as _i1;
import 'package:project_soaring/page/spawn.dart' as _i2;

/// generated route for
/// [_i1.LauncherPage]
class LauncherRoute extends _i3.PageRouteInfo<void> {
  const LauncherRoute({List<_i3.PageRouteInfo>? children})
    : super(LauncherRoute.name, initialChildren: children);

  static const String name = 'LauncherRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.LauncherPage();
    },
  );
}

/// generated route for
/// [_i2.SpawnPage]
class SpawnRoute extends _i3.PageRouteInfo<void> {
  const SpawnRoute({List<_i3.PageRouteInfo>? children})
    : super(SpawnRoute.name, initialChildren: children);

  static const String name = 'SpawnRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.SpawnPage();
    },
  );
}
