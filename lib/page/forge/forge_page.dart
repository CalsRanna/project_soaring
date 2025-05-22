import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_soaring/page/forge/forge_view_model.dart';
import 'package:project_soaring/widget/item_slot.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class ForgePage extends StatefulWidget {
  const ForgePage({super.key});

  @override
  State<ForgePage> createState() => _ForgePageState();
}

class _ForgePageState extends State<ForgePage> {
  final viewModel = GetIt.instance.get<ForgeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('锻造')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Spacer(),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return Watch(
                    (context) => ItemSlot(
                      item: viewModel.materials.value[index],
                      placeholder: viewModel.placeholders[index],
                      onTap: () => viewModel.openBottomSheet(index),
                    ),
                  );
                },
                itemCount: 9,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
              Spacer(),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: viewModel.forge,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all()),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('开始锻造'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
