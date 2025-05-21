import 'package:flutter/material.dart';
import 'package:project_soaring/util/dialog_util.dart';

class HomeGuildView extends StatelessWidget {
  const HomeGuildView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('G')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                DialogUtil.instance.warning('G ${index + 1} is not available');
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(border: Border.all()),
                child: Text('G ${index + 1}'),
              ),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }
}
