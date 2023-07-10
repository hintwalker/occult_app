import 'package:flutter/material.dart';
import 'package:tauari_list_view/src/simple_text_group.dart';

class BasicGroupSeperatorWidget extends StatelessWidget {
  const BasicGroupSeperatorWidget(
    this.content, {
    super.key,
    required this.colorScheme,
  });
  final SimpleTextGroup content;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        bottom: 8.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: colorScheme.primary,
              height: 1.0,
              thickness: 1.0,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Text(content.label),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Divider(
              color: colorScheme.primary,
              height: 1.0,
              thickness: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
