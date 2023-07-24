import 'package:flutter/material.dart';
import 'package:tauari_sort/tauari_sort.dart';
import 'star_sort_value.dart';

Iterable<SortOption> starSortOptions(String Function(String) translate) => [
      // SortOption(
      //   icon: const Icon(Icons.star_border),
      //   label: translate(StarSortValue.sortByDefaultAsc),
      //   value: const SortValue(StarSortValue.sortByDefaultAsc, ListOrder.asc),
      // ),
      // SortOption(
      //   icon: const Icon(Icons.star_border),
      //   label: translate(StarSortValue.sortByDefaultDesc),
      //   value: const SortValue(StarSortValue.sortByDefaultDesc, ListOrder.desc),
      // ),
      SortOption(
        icon: const Icon(Icons.text_fields),
        label: translate(StarSortValue.sortByNameAsc),
        value: const SortValue(StarSortValue.sortByNameAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.text_fields),
        label: translate(StarSortValue.sortByNameDesc),
        value: const SortValue(StarSortValue.sortByNameDesc, ListOrder.desc),
      ),
    ];
