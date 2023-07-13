import 'package:flutter/material.dart';

class BasicBottomSheet extends StatelessWidget {
  const BasicBottomSheet({
    super.key,
    required this.title,
    required this.colorScheme,
    required this.child,
  });
  final Widget child;
  final String title;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return
        // Material(
        // child:
        // SingleChildScrollView(
        // child: SafeArea(
        // child:
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  color: colorScheme.surfaceVariant),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close))
                ],
              )),
          // child
          Expanded(child: child),
        ]
            // ),
            // ),
            );
  }
}
