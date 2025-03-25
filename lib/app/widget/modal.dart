import 'package:flutter/material.dart';

class Modal {
  BuildContext context;

  Modal(this.context);

  Modal.of(this.context);

  Future<void> show({bool barrierDismissible = true, Widget? child}) async {
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}
