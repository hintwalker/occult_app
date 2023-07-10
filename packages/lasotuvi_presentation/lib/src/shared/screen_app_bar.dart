import 'package:flutter/material.dart';

class ScreenAppBar extends StatelessWidget {
  const ScreenAppBar(
    this.title, {
    super.key,
    this.leading,
    this.actions,
  });
  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Text(title, style: const TextStyle(fontSize: 20.0)),
      actions: actions,
    );
  }
}
