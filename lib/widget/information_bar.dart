import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_soaring/dispatcher/excercise_dispatcher.dart';
import 'package:project_soaring/provider/character_provider.dart';
import 'package:project_soaring/widget/game_button.dart';
import 'package:project_soaring/widget/game_dialog.dart';

class InformationBar extends StatelessWidget {
  const InformationBar({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => _showCharacterParticular(context),
            child: Text(character.name),
          ),
          Text('年龄：${character.age}'),
          Text('修为: ${character.experienceString}'),
          Text('灵石: ${character.magicStone}'),
        ],
      ),
    );
  }

  void _showCharacterParticular(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => GameDialog(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(character.name),
            Text('${character.age}/${character.lifetime}'),
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.white)),
              ),
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GameButton(
                    onTap: () => _chooseArchives(context),
                    child: const Text('选择存档'),
                  ),
                  const SizedBox(width: 8),
                  GameButton(onTap: _exit, child: const Text('退出游戏')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _chooseArchives(BuildContext context) {
    Navigator.of(context).pop();
    ExcerciseDispatcher.stop();
    context.go('/archives');
  }

  void _exit() {
    ExcerciseDispatcher.stop();
    exit(0);
  }
}
