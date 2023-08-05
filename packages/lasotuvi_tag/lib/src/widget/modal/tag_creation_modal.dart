import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../tag_creation_widget.dart';

class TagCreationModal extends StatelessWidget {
  const TagCreationModal({
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.onCreateTag,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final void Function(String title, String subTitle) onCreateTag;

  @override
  Widget build(BuildContext context) {
    return BasicDialog(
      title: translate('tagCreation'),
      // colorScheme: colorScheme,
      children: [
        TagCreationWidget(
            colorScheme: colorScheme,
            translate: translate,
            onCreateTag: (title, subTitle) {
              onCreateTag(title, subTitle);
              Navigator.pop(context);
            }),
      ],
    );
  }
}
