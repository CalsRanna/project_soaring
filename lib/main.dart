import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_soaring/page/combat/combat_view_model.dart';
import 'package:project_soaring/page/exercise/exercise_view_model.dart';
import 'package:project_soaring/page/forge/forge_view_model.dart';
import 'package:project_soaring/page/home/home_view_model.dart';
import 'package:project_soaring/page/market/market_view_model.dart';
import 'package:project_soaring/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DI.ensureInitialized();
  runApp(const ProjectSoaring());
}

class ProjectSoaring extends StatelessWidget {
  const ProjectSoaring({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      theme: ThemeData(
        // brightness: Brightness.dark,
        fontFamily: 'DanGuYin',
      ),
    );
  }
}

class DI {
  static void ensureInitialized() {
    GetIt.instance.registerLazySingleton(() => HomeViewModel());
    GetIt.instance.registerFactory(() => CombatViewModel());
    GetIt.instance.registerFactory(() => ExerciseViewModel());
    GetIt.instance.registerFactory(() => ForgeViewModel());
    GetIt.instance.registerFactory(() => MarketViewModel());
  }
}
