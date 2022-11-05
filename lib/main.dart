import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/page/adventure/spirit_mountain.dart';
import 'package:project_soaring/page/archives.dart';
import 'package:project_soaring/page/bag/item.dart';
import 'package:project_soaring/page/birthplace.dart';
import 'package:project_soaring/page/home/excercise.dart';
import 'package:project_soaring/page/market/item_market.dart';
import 'package:project_soaring/page/sect/sect.dart';
import 'package:project_soaring/page/start.dart';
import 'package:project_soaring/provider/character_provider.dart';
import 'package:project_soaring/provider/items_provider.dart';
import 'package:project_soaring/spell/spell.dart';

void main() async {
  Hive.registerAdapter(CharacterAdapter());
  Hive.registerAdapter(SpellAdapter());
  Hive.registerAdapter(ItemAdapter());

  try {
    await Hive.initFlutter();
    await Hive.openBox<Character>('character');
    await Hive.openBox<String>('archive');
  } catch (e) {
    Hive.deleteBoxFromDisk('character');
  }

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter _route = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        pageBuilder: (_, state) => const NoTransitionPage(child: Start()),
        path: "/",
      ),
      GoRoute(
        pageBuilder: (_, state) => const NoTransitionPage(child: Archives()),
        path: "/archives",
      ),
      GoRoute(
        pageBuilder: (_, state) => const NoTransitionPage(child: Birthplace()),
        path: "/birthplace",
      ),
      GoRoute(redirect: (_) => '/home/excercise', path: "/home"),
      GoRoute(
        pageBuilder: (_, state) =>
            const NoTransitionPage(child: ExcercisePage()),
        path: "/home/excercise",
      ),
      GoRoute(redirect: (_) => '/bag/item', path: "/bag"),
      GoRoute(
        pageBuilder: (_, state) => const NoTransitionPage(child: ItemPage()),
        path: "/bag/item",
      ),
      GoRoute(redirect: (_) => '/market/item', path: "/market"),
      GoRoute(
        pageBuilder: (_, state) =>
            const NoTransitionPage(child: ItemMarketPage()),
        path: "/market/item",
      ),
      GoRoute(
          redirect: (_) => '/adventure/spirit-mountain', path: "/adventure"),
      GoRoute(
        pageBuilder: (_, state) =>
            const NoTransitionPage(child: SpiritMountainPage()),
        path: "/adventure/spirit-mountain",
      ),
      GoRoute(redirect: (_) => '/sect/sect', path: "/sect"),
      GoRoute(
        pageBuilder: (_, state) => const NoTransitionPage(child: SectPage()),
        path: "/sect/sect",
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    return MaterialApp.router(
      routeInformationParser: _route.routeInformationParser,
      routerDelegate: _route.routerDelegate,
    );
  }
}
