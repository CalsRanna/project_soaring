import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:project_soaring/page/combat/combat_view_model.dart';
import 'package:project_soaring/widget/item_slot.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class CombatPage extends StatefulWidget {
  const CombatPage({super.key});

  @override
  State<CombatPage> createState() => _CombatPageState();
}

class _CombatPageState extends State<CombatPage> {
  final viewModel = GetIt.instance.get<CombatViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.combat();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(title: const Text('探索'), leading: const SizedBox()),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 16,
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  child: Text('\n\n\n'),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    child: Watch(
                      (context) => GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          return ItemSlot(item: viewModel.loots.value[index]);
                        },
                        itemCount: viewModel.loots.value.length,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 200,
                  child: Watch(
                    (context) => ListView.builder(
                      controller: viewModel.logController,
                      itemBuilder: (context, index) {
                        return Text(viewModel.logs.value[index]);
                      },
                      itemCount: viewModel.logs.value.length,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pop();
          },
          label: const Text('结束探索'),
          icon: const Icon(HugeIcons.strokeRoundedCancel01),
        ),
      ),
    );
  }
}
