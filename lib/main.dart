import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/launcher.dart';
import 'package:project_soaring/schema/isar.dart';

void main() async {
  await IsarInitializer.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const LauncherPage(),
    );
  }
}

class ToolbarTile extends StatefulWidget {
  const ToolbarTile({super.key, required this.label, this.onTap});

  final String label;
  final void Function()? onTap;

  @override
  State<ToolbarTile> createState() => _ToolbarTileState();
}

class _ToolbarTileState extends State<ToolbarTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: 72,
        child: Text(widget.label),
      ),
    );
  }
}
