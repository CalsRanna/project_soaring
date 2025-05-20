import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class HomeCharacterView extends StatelessWidget {
  const HomeCharacterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('C')),
      body: Padding(
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
            AspectRatio(
              aspectRatio: 2 / 1,
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
                      return Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text(''),
                      );
                    },
                    itemCount: 8,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                padding: EdgeInsets.all(16),
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
