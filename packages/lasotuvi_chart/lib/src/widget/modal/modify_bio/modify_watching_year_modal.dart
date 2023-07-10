import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class ModifyWatchingYearModal extends StatelessWidget {
  const ModifyWatchingYearModal({
    super.key,
    required this.child,
    required this.title,
  });
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BasicDialog(title: title, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: child,
      ),
    ]);
  }
}
