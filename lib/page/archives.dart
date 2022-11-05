import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_soaring/dispatcher/archive_dispatcher.dart';
import 'package:project_soaring/page/home/excercise.dart';
import 'package:project_soaring/provider/archives_provider.dart';
import 'package:project_soaring/provider/character_provider.dart';
import 'package:project_soaring/util/game_generator.dart';
import 'package:project_soaring/widget/game_app.dart';
import 'package:project_soaring/widget/game_button.dart';
import 'package:project_soaring/widget/game_dialog.dart';

final currentArchiveProvider = StateProvider((ref) => '');
final currentArchiveIndexProvider = StateProvider((ref) => 0);

class Archives extends HookConsumerWidget {
  const Archives({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var archives = ref.watch(archivesProvider);

    var children = <Widget>[];
    for (int i = 0; i < archives.length; i++) {
      children.add(
        _ArchiveButton(
          onTap: () => _loadArchive(context, ref, i),
          name: archives[i] ?? '新存档',
        ),
      );

      children.add(const SizedBox(height: 8));
    }

    children.add(GameButton(
      onTap: () => _pop(context),
      child: const Text('返回'),
    ));

    return GameApp(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  void _loadArchive(BuildContext context, WidgetRef ref, int index) {
    var archives = ref.watch(archivesProvider);

    if (archives[index] != null) {
      showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (_) => GameDialog(
          tip: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GameButton(
                onTap: () => _enterGame(context, ref, archives[index]!),
                child: const Text('读取存档'),
              ),
              const SizedBox(height: 8),
              GameButton(
                onTap: () => _deleteArchive(
                  context,
                  ref,
                  archives[index]!,
                  index,
                ),
                child: const Text('删除存档'),
              ),
            ],
          ),
        ),
      );
    } else {
      var archive = GameGenerator.name();

      var archive0 = archives[0];
      var archive1 = archives[1];
      var archive2 = archives[2];
      var newArchives = <String?>[archive0, archive1, archive2];
      newArchives[index] = archive;

      ref.read(archivesProvider.notifier).init(newArchives);
      ref.read(currentArchiveProvider.state).state = archive;
      ref.read(currentArchiveIndexProvider.state).state = index;
      context.go('/birthplace');
    }
  }

  void _enterGame(BuildContext context, WidgetRef ref, String archive) {
    var box = Hive.box<Character>('character');

    /// 载入玩家存档信息
    ref.read(characterProvider.notifier).init(box.get(archive));

    /// 计算离线收益
    var formattedString =
        Hive.box<String>('archive').get('$archive-saved-date-time');
    var dateTime = formattedString != null
        ? DateTime.parse(formattedString)
        : DateTime.now();
    var seconds = DateTime.now().difference(dateTime).inSeconds;
    if (seconds > 60) {
      ref.read(hasOfflineExperienceProvider.state).state = true;
      ref.read(offlineSecondsProvider.state).state = seconds;
    }

    /// 在内存中保存当前游玩存档的名称，用于游戏过程中自动保存存档
    ref.read(currentArchiveProvider.state).state = archive;

    // ArchiveDispatcher.start(() {
    //   var character = ref.read(characterProvider.);
    //   print(character.equipments);
    //   print(character.name);
    //   print(character.experience);
    //   Hive.box<Character>('character').put(archive, character);
    //   Hive.box<String>('archive').put(
    //     '$archive-saved-date-time',
    //     DateTime.now().toString(),
    //   );
    // });

    Navigator.of(context).pop();
    context.go('/home');
  }

  void _deleteArchive(
      BuildContext context, WidgetRef ref, String archive, int index) {
    var archive = ref.watch(currentArchiveProvider);
    var index = ref.watch(currentArchiveIndexProvider);

    // 删除存档Provider
    var archives = ref.watch(archivesProvider);
    archives[index] = null;
    ref.watch(archivesProvider.notifier).init(archives);

    // 删除存档box
    var box = Hive.box<Character>('character');
    box.delete(archive);
    var archiveBox = Hive.box<String>('archive');
    archiveBox.delete('archive$index');

    Navigator.of(context).pop();
  }

  void _pop(BuildContext context) {
    context.go('/');
  }
}

class _ArchiveButton extends StatefulWidget {
  const _ArchiveButton({Key? key, required this.name, this.onTap})
      : super(key: key);

  final String name;
  final void Function()? onTap;

  @override
  State<_ArchiveButton> createState() => __ArchiveButtonState();
}

class __ArchiveButtonState extends State<_ArchiveButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: isClicked ? Colors.white30 : Colors.black,
          shape: BoxShape.rectangle,
        ),
        padding: const EdgeInsets.symmetric(vertical: 24),
        width: 200,
        child: Text(widget.name),
      ),
    );
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      isClicked = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => isClicked = false);
    widget.onTap?.call();
  }
}
