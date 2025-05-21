import 'package:flutter/material.dart';
import 'package:project_soaring/router/router.dart';

class DialogUtil {
  static final instance = DialogUtil._();

  DialogUtil._();

  void warning(String content) {
    showDialog(
      builder: (context) => _WarningDialog(content: content),
      context: router.navigatorKey.currentContext!,
    );
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
    return Dialog(shape: shape, child: _buildContent(context));
  }

  Widget _buildCancelButton(BuildContext context) {
    var container = Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text('Cancel'),
    );
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: container,
    );
  }

  Widget _buildContent(BuildContext context) {
    var buttons = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [_buildCancelButton(context)],
    );
    var body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [Text(content), buttons],
    );
    return Padding(padding: const EdgeInsets.all(16), child: body);
  }
}
