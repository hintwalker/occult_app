import 'package:flutter/material.dart';

class SimpleDialogHeader extends StatelessWidget {
  const SimpleDialogHeader(
    this.title, {
    super.key,
    this.onClose,
  });
  final String title;
  final void Function()? onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
            if (onClose != null) {
              onClose!();
            }
          },
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}
