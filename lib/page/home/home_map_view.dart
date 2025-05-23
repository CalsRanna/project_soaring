import 'package:flutter/material.dart';
import 'package:project_soaring/constant/strings.dart';

class HomeMapView extends StatelessWidget {
  final void Function(int)? onTap;
  const HomeMapView({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.map)),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, i) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onTap?.call(i),
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              padding: const EdgeInsets.all(16),
              child: Text('${Strings.map} ${i + 1}'),
            ),
          );
        },
        itemCount: 100,
        separatorBuilder: (context, i) => const SizedBox(height: 16),
      ),
    );
  }
}
