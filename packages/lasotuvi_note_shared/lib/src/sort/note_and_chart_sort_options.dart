import 'package:flutter/material.dart';
import 'note_sort_options.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import 'note_sort_value.dart';

Iterable<SortOption> noteAndChartSortOptions(
        String Function(String) translate) =>
    [
      ...noteSortOptions(translate),
      SortOption(
        icon: const Icon(Icons.badge_outlined),
        label: translate(NoteSortValue.sortByChartNameAsc),
        value: const SortValue(NoteSortValue.sortByChartNameAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.badge_outlined),
        label: translate(NoteSortValue.sortByChartNameDesc),
        value:
            const SortValue(NoteSortValue.sortByChartNameDesc, ListOrder.desc),
      ),
    ];
