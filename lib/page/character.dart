import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_soaring/component/toolbar.dart';
import 'package:project_soaring/provider/character.dart';
import 'package:project_soaring/provider/stat.dart';
import 'package:project_soaring/util/label.dart';
import 'package:project_soaring/widget/container.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('角色'),
      ),
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final character = ref.watch(characterNotifierProvider);
          return switch (character) {
            AsyncData(:final value) => Column(
                children: [
                  Row(
                    children: [
                      SoaringContainer(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        width: 96,
                        child: Center(child: Text(value.name)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SoaringContainer(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('等级：${value.level}'),
                              Text('经验值：${value.experience}'),
                              Text('金钱：${value.gold}'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const CustomDivider(label: '基本属性'),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0; i < 4; i++)
                              Consumer(builder: (context, ref, child) {
                                final provider = ref.watch(statsProvider(i));
                                final stat = switch (provider) {
                                  AsyncData(:final value) => value,
                                  _ => 0,
                                };
                                return Text('${Labels.traits[i]}：$stat');
                              }),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 4; i < 10; i++)
                              Consumer(builder: (context, ref, child) {
                                final provider = ref.watch(statsProvider(i));
                                final stat = switch (provider) {
                                  AsyncData(:final value) => value,
                                  _ => 0,
                                };
                                return Text('${Labels.traits[i]}：$stat');
                              }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const CustomDivider(label: '其他属性'),
                  const SizedBox(height: 16),
                  for (var i = 10; i < 17; i++)
                    Consumer(builder: (context, ref, child) {
                      final provider = ref.watch(statsProvider(i));
                      final stat = switch (provider) {
                        AsyncData(:final value) => value,
                        _ => 0,
                      };
                      return Text('${Labels.traits[i]}：$stat');
                    }),
                  const Spacer(),
                  const Toolbar(),
                ],
              ),
            _ => const SizedBox(),
          };
        }),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Transform.rotate(
          angle: pi / 4,
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).colorScheme.onSurface),
            ),
            width: 8,
            height: 8,
          ),
        ),
        const SizedBox(width: 16),
        Text(label ?? ''),
        const SizedBox(width: 16),
        Transform.rotate(
          angle: pi / 4,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            width: 8,
            height: 8,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
