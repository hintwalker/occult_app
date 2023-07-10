import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class ModifyBirthdayModal extends StatelessWidget {
  const ModifyBirthdayModal({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BasicDialog(title: title, children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: child,
      )
    ]);
  }
}
