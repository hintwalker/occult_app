import 'package:flutter/material.dart';

import 'simple_dialog_header.dart';

class BasicDialog extends StatelessWidget {
  const BasicDialog({
    super.key,
    required this.title,
    required this.children,
  });
  final String title;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: SimpleDialogHeader(title),
      titlePadding:
          const EdgeInsets.only(left: 12.0, top: 8.0, right: 8.0, bottom: 0.0),
      children: children,
    );
  }
}
