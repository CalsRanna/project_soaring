import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/provider/dungeon.dart';
import 'package:project_soaring/schema/dungeon.dart';
import 'package:project_soaring/widget/container.dart';

class DungeonsPage extends StatefulWidget {
  const DungeonsPage({super.key});

  @override
  State<DungeonsPage> createState() => _DungeonsPageState();
}

class _DungeonsPageState extends State<DungeonsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('地下城列表')),
      body: Consumer(builder: (context, ref, child) {
        final provider = ref.watch(dungeonsNotifierProvider);
        List<Dungeon> dungeons = switch (provider) {
          AsyncData(:final value) => value,
          _ => [],
        };
        return ListView.separated(
          itemBuilder: (context, index) => SoaringContainer(
            child: Text(dungeons[index].name),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: dungeons.length,
        );
      }),
    );
  }
}
