import 'package:flutter/material.dart';

class HomeMapView extends StatelessWidget {
  final void Function(int)? onTap;
  const HomeMapView({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('M')),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return ListTile(
            title: Text('W ${i + 1}'),
            onTap: () => onTap?.call(i),
          );
        },
        itemCount: 100,
      ),
    );
  }
}
