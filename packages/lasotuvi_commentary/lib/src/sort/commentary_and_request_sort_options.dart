import 'package:flutter/material.dart';
import 'package:tauari_sort/tauari_sort.dart';
import 'commentary_sort_options.dart';

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
