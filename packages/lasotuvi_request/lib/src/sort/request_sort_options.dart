import 'package:flutter/material.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import 'request_sort_value.dart';

Iterable<SortOption> requestSortOptions(String Function(String) translate) => [
      SortOption(
        icon: const Icon(Icons.self_improvement),
        label: translate(RequestSortValue.sortBySolvedAsc),
        value: const SortValue(RequestSortValue.sortBySolvedAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.self_improvement),
        label: translate(RequestSortValue.sortBySolvedDesc),
        value:
            const SortValue(RequestSortValue.sortBySolvedDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.remove_red_eye_sharp),
        label: translate(RequestSortValue.sortByLastViewedDesc),
        value: const SortValue(
            RequestSortValue.sortByLastViewedDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.remove_red_eye_sharp),
        label: translate(RequestSortValue.sortByLastViewedAsc),
        value: const SortValue(
            RequestSortValue.sortByLastViewedAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.create_new_folder_outlined),
        label: translate(RequestSortValue.sortByCreatedAsc),
        value:
            const SortValue(RequestSortValue.sortByCreatedAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.create_new_folder_outlined),
        label: translate(RequestSortValue.sortByCreatedDesc),
        value:
            const SortValue(RequestSortValue.sortByCreatedDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.text_fields),
        label: translate(RequestSortValue.sortByNameDesc),
        value: const SortValue(RequestSortValue.sortByNameDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.text_fields),
        label: translate(RequestSortValue.sortByNameAsc),
        value: const SortValue(RequestSortValue.sortByNameAsc, ListOrder.asc),
      ),
    ];
