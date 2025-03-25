import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_soaring/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const ProjectSoaring());
}

class ProjectSoaring extends StatelessWidget {
  const ProjectSoaring({super.key});

  @override
  Widget build(BuildContext context) {
    const appBarTheme = AppBarTheme(surfaceTintColor: Colors.transparent);
    return MaterialApp.router(
      routerConfig: soaringRouter.config(),
      theme: ThemeData(
        appBarTheme: appBarTheme,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
    );
  }
}
