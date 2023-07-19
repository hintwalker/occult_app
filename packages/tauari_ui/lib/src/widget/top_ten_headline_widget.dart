import 'package:flutter/material.dart';

import 'top_ten_add_data_button.dart';
import 'top_ten_show_all_button.dart';
import 'top_ten_title_widget.dart';

class TopTenHeadlineWidget extends StatelessWidget {
  const TopTenHeadlineWidget(
    this.title, {
    super.key,
    required this.colorScheme,
    required this.onAddData,
    required this.onShowAll,
    required this.showAllText,
  });

  final String title;
  final ColorScheme colorScheme;
  final void Function()? onAddData;
  final void Function() onShowAll;
  final String showAllText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TopTenTitleWidget(title, colorScheme: colorScheme),
        const SizedBox(
          width: 12.0,
        ),
        if (onAddData != null)
          TopTenAddDataButton(colorScheme: colorScheme, onTap: onAddData!),
        const Spacer(),
        TopTenShowAllButton(showAllText,
            onTap: onShowAll, colorScheme: colorScheme)
      ],
    );
  }
}
