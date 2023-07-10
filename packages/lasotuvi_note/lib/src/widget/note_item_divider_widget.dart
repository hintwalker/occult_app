import 'package:flutter/material.dart';

class NoteItemDividerWidget extends StatelessWidget {
  const NoteItemDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 2.0,
      width: 160.0,
      child: Divider(
        height: 4.0,
        thickness: 1.0,
        indent: 0.0,
        endIndent: 0.0,
      ),
    );
  }
}
