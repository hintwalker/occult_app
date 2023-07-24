import 'package:flutter/material.dart';
import 'package:tauari_sort/tauari_sort.dart';

import 'chart_sort_value.dart';

Iterable<SortOption> chartSortOptions(String Function(String) translate) => [
      SortOption(
        icon: const Icon(Icons.today),
        label: translate(ChartSortValue.sortByLastViewDesc),
        value:
            const SortValue(ChartSortValue.sortByLastViewDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.today),
        label: translate(ChartSortValue.sortByLastViewAsc),
        value: const SortValue(ChartSortValue.sortByLastViewAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.text_fields),
        label: translate(ChartSortValue.sortByNameAsc),
        value: const SortValue(ChartSortValue.sortByNameAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.text_fields),
        label: translate(ChartSortValue.sortByNameDesc),
        value: const SortValue(ChartSortValue.sortByNameDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.create_new_folder_outlined),
        label: translate(ChartSortValue.sortByCreatedDesc),
        value:
            const SortValue(ChartSortValue.sortByCreatedDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.create_new_folder_outlined),
        label: translate(ChartSortValue.sortByCreatedAsc),
        value: const SortValue(ChartSortValue.sortByCreatedAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.cake),
        label: translate(ChartSortValue.sortByBirthdayDesc),
        value:
            const SortValue(ChartSortValue.sortByBirthdayDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.cake),
        label: translate(ChartSortValue.sortByBirthdayAsc),
        value: const SortValue(ChartSortValue.sortByBirthdayAsc, ListOrder.asc),
      ),
    ];
