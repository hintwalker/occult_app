import 'package:flutter/material.dart';

import '../../../basic_autosize_text.dart';

class HouseThanView extends StatelessWidget {
  const HouseThanView(
    this.visible, {
    super.key,
    required this.translate,
    required this.colorScheme,
  });
  final bool visible;
  final String Function(String) translate;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return visible
        ? Container(
            decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: colorScheme.secondary,
                )),
            child: BasicAutoSizeText(
              translate('than'),
              upperCase: true,
              overflow: TextOverflow.fade,
              style: TextStyle(
                  fontSize: 7,
                  // fontWeight: FontWeight.w500,
                  // backgroundColor: colorScheme.primary,
                  color: colorScheme.onPrimary),
            ),
          )
        : const SizedBox.shrink();
  }
}
