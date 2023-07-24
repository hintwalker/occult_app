import 'package:flutter/material.dart';
import 'package:tauari_sort/tauari_sort.dart';
import 'sort_option_item_widget.dart';

class SortOptionListcontainer extends StatelessWidget {
  const SortOptionListcontainer({
    super.key,
    required this.options,
    required this.colorScheme,
    required this.onItemTap,
  });
  final Iterable<SortOption> options;
  final ColorScheme colorScheme;
  final void Function(SortValue) onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 48.0),
      shrinkWrap: true,
      itemBuilder: (_, index) => SortOptionItemWidget(
          data: options.elementAt(index),
          colorScheme: colorScheme,
          onTap: onItemTap),
      separatorBuilder: (_, __) => const Divider(
        height: 1.0,
        thickness: 1.0,
      ),
      itemCount: options.length,
    );
  }
}
