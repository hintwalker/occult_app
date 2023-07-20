import 'package:flutter/material.dart';
import 'commentary_sort_options.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import 'commentary_sort_value.dart';

Iterable<SortOption> commentaryAndRequestSortOptions(
        String Function(String) translate) =>
    [
      ...commentarySortOptions(translate),
      SortOption(
        icon: const Icon(Icons.badge_outlined),
        label: translate(CommentarySortValue.sortByChartNameAsc),
        value: const SortValue(
            CommentarySortValue.sortByChartNameAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.badge_outlined),
        label: translate(CommentarySortValue.sortByChartNameDesc),
        value: const SortValue(
            CommentarySortValue.sortByChartNameDesc, ListOrder.desc),
      ),
    ];
