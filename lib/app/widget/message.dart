import 'package:flutter/material.dart';

class Message {
  BuildContext? context;
  OverlayEntry? entry;

  Message(this.context);

  Message.of(BuildContext this.context);

  Future<void> show(String message) async {
    final overlay = Overlay.of(context!);
    entry?.remove();
    entry = OverlayEntry(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final surface = colorScheme.surface;
        final surfaceContainerHighest = colorScheme.surfaceContainerHighest;
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: surfaceContainerHighest),
                borderRadius: BorderRadius.circular(4),
                color: surface,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(message),
            ),
          ),
        );
      },
    );
    overlay.insert(entry!);
    await Future.delayed(const Duration(milliseconds: 500));
    entry?.remove();
  }
}
