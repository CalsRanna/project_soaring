import 'package:flutter/material.dart';
import 'package:project_soaring/router/router.dart';

class DialogUtil {
  static final instance = DialogUtil._();

  DialogUtil._();

  void dismiss({int count = 1}) {
    var navigator = Navigator.of(router.navigatorKey.currentContext!);
    for (int i = 0; i < count; i++) {
      if (navigator.canPop()) {
        navigator.pop();
      }
    }
  }

  void loading() {
    show(_LoadingDialog());
  }

  void openBottomSheet(Widget bottomSheet) {
    showModalBottomSheet(
      builder: (context) => bottomSheet,
      context: router.navigatorKey.currentContext!,
    );
  }

  void show(Widget dialog) {
    showDialog(
      builder: (context) => dialog,
      context: router.navigatorKey.currentContext!,
    );
  }

  void warning(String content) {
    showDialog(
      builder: (context) => _WarningDialog(content: content),
      context: router.navigatorKey.currentContext!,
    );
  }
}

class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog();

  @override
  Widget build(BuildContext context) {
    var shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
      side: BorderSide(),
    );
    return Dialog(shape: shape, child: _buildBody());
  }

  Padding _buildBody() {
    var sizedBox = SizedBox(
      height: 100,
      child: Center(child: CircularProgressIndicator()),
    );
    return Padding(padding: const EdgeInsets.all(16.0), child: sizedBox);
  }
}

class _WarningDialog extends StatelessWidget {
  final String content;
  const _WarningDialog({required this.content});

  @override
  Widget build(BuildContext context) {
    var shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
      side: BorderSide(),
    );
    return Dialog(shape: shape, child: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    var buttons = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [_buildCancelButton(context)],
    );
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [Text(content), buttons],
    );
    return Padding(padding: const EdgeInsets.all(16), child: column);
  }

  Widget _buildCancelButton(BuildContext context) {
    var container = Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text('取消'),
    );
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: container,
    );
  }
}
