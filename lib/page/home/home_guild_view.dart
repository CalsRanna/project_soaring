import 'package:flutter/material.dart';
import 'package:project_soaring/constant/strings.dart';
import 'package:project_soaring/router/router.gr.dart';

class HomeGuildView extends StatelessWidget {
  const HomeGuildView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.guild)),
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
              onTap: () => navigate(context, index),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(border: Border.all()),
                child: Text(Strings.guildFeatures[index]),
              ),
            );
          },
          itemCount: Strings.guildFeatures.length,
        ),
      ),
    );
  }

  void navigate(BuildContext context, int index) {
    if (index == 0) {
      MarketRoute().push(context);
    }
  }
}
