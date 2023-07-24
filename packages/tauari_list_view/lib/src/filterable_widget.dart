import 'package:flutter/material.dart';
import 'package:tauari_sort/tauari_sort.dart';
import 'package:tauari_ui/tauari_ui.dart';

import 'search_box_widget.dart';
import 'sort_option_list_container.dart';
import 'sort_options_button.dart';

class FilterableWidget extends StatelessWidget {
  const FilterableWidget({
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.onSearch,
    required this.onSortOptionSelected,
    required this.sortOptions,
    required this.child,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final void Function(String query) onSearch;
  final void Function(SortValue) onSortOptionSelected;
  final Widget child;
  final Iterable<SortOption> sortOptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SearchBoxWidget(
                  colorScheme: colorScheme,
                  translate: translate,
                  onSearch: onSearch,
                ),
              ),
              const SizedBox(
                width: 4.0,
              ),
              SortOptionsButton(
                colorScheme: colorScheme,
                onTap: () => showSortOptions(context, onSortOptionSelected),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Expanded(child: child),
      ],
    );
  }

  Future<void> showSortOptions(
      BuildContext context, void Function(SortValue) callback) async {
    final result = await showModalBottomSheet<SortValue>(
      context: context,
      builder: (_) {
        return BasicBottomSheet(
          title: translate('sortOption'),
          colorScheme: colorScheme,
          child: SortOptionListcontainer(
            options: sortOptions,
            colorScheme: colorScheme,
            onItemTap: (option) => Navigator.of(context).pop(option),
          ),
        );
      },
    );
    if (result != null) {
      callback(result);
    }
  }
}
