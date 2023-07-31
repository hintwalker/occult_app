import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

import 'date_name_text.dart';

class CanChiGroup extends StatelessWidget {
  const CanChiGroup({
    super.key,
    this.can,
    this.chi,
    this.colorScheme,
    this.translate,
  });
  final Cans? can;
  final Chies? chi;
  final ColorScheme? colorScheme;
  final String Function(String)? translate;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: colorScheme != null
                  ? colorScheme!.outline.withOpacity(0.3)
                  : Colors.grey.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(22)),
        child: Row(
          children: [
            Expanded(
                child: DateNameText(
              can?.name,
              align: TextAlign.end,
              translate: translate,
            )),
            const SizedBox(
              width: 4,
            ),
            Expanded(
                child: DateNameText(
              chi?.name,
              align: TextAlign.start,
              translate: translate,
            ))
          ],
        ));
  }
}
