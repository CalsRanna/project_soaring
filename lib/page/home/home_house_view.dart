import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_soaring/router/router.gr.dart';

class HomeHouseView extends StatelessWidget {
  const HomeHouseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('H')),
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
                AutoRouter.of(context).push(ExerciseRoute());
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(border: Border.all()),
                child: Text('H ${index + 1}'),
              ),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }
}
