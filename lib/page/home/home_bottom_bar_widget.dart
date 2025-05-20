import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  final List<HomeBottomBarItem> items;
  final int? selectedIndex;
  final void Function(int)? onItemSelected;
  const HomeBottomBar({
    super.key,
    required this.items,
    this.onItemSelected,
    this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: SafeArea(
        top: false,
        child: Row(spacing: 4, children: _buildChildren()),
      ),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> children = [];
    for (int i = 0; i < items.length; i++) {
      var gestureDetector = GestureDetector(
        onTap: () => onItemSelected?.call(i),
        child: Container(
          decoration: BoxDecoration(
            border: i == selectedIndex ? Border.all() : null,
          ),
          padding: EdgeInsets.symmetric(vertical: 8),
          child: items[i],
        ),
      );
      children.add(Expanded(child: gestureDetector));
    }
    return children;
  }
}

class HomeBottomBarItem extends StatelessWidget {
  final String label;
  const HomeBottomBarItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label, textAlign: TextAlign.center);
  }
}
