import 'package:flutter/material.dart';

class DungeonsPage extends StatefulWidget {
  const DungeonsPage({super.key});

  @override
  State<DungeonsPage> createState() => _DungeonsPageState();
}

class _DungeonsPageState extends State<DungeonsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('地宫列表')),
      // body: Consumer(builder: (context, ref, child) {
      //   final provider = ref.watch(dungeonsNotifierProvider);
      //   List<Dungeon> dungeons = switch (provider) {
      //     AsyncData(:final value) => value,
      //     _ => [],
      //   };
      //   return ListView.separated(
      //     itemBuilder: (context, index) {
      //       return _DungeonTile(
      //         dungeon: dungeons[index],
      //         onTap: () => handleTap(ref, dungeons[index].id),
      //       );
      //     },
      //     itemCount: dungeons.length,
      //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //     separatorBuilder: (context, index) => const SizedBox(height: 16),
      //   );
      // }),
    );
  }

  // void handleTap(WidgetRef ref, int id) async {
  //   final notifier = ref.read(dungeonsNotifierProvider.notifier);
  //   await notifier.rogueLiteTiles(id);
  //   if (!mounted) return;
  //   DungeonPageRoute(id: id).push(context);
  // }
}

// class _DungeonTile extends StatelessWidget {
//   const _DungeonTile({required this.dungeon, this.onTap});

//   final Dungeon dungeon;
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     final color = Labels.difficultyColors[dungeon.difficulty];
//     final difficulty = Labels.difficultyTexts[dungeon.difficulty];
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: onTap,
//       child: SoaringContainer(
//         padding: const EdgeInsets.all(8),
//         child: Row(
//           children: [
//             SizedBox(
//               width: 96,
//               child: Center(
//                 child: Text(difficulty, style: TextStyle(color: color)),
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [Text(dungeon.name), Text(dungeon.story)],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
