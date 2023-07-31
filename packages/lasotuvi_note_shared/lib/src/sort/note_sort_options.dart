import 'package:flutter/material.dart';
import 'package:tauari_sort/tauari_sort.dart';

import 'note_sort_value.dart';

Iterable<SortOption> noteSortOptions(String Function(String) translate) => [
      SortOption(
        icon: const Icon(Icons.edit),
        label: translate(NoteSortValue.sortByEditedDesc),
        value: const SortValue(NoteSortValue.sortByEditedDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.edit),
        label: translate(NoteSortValue.sortByEditedAsc),
        value: const SortValue(NoteSortValue.sortByEditedAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.create_new_folder_outlined),
        label: translate(NoteSortValue.sortByCreatedDesc),
        value: const SortValue(NoteSortValue.sortByCreatedDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.create_new_folder_outlined),
        label: translate(NoteSortValue.sortByCreatedAsc),
        value: const SortValue(NoteSortValue.sortByCreatedAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.text_fields),
        label: translate(NoteSortValue.sortByTitleAsc),
        value: const SortValue(NoteSortValue.sortByTitleAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.text_fields),
        label: translate(NoteSortValue.sortByTitleDesc),
        value: const SortValue(NoteSortValue.sortByTitleDesc, ListOrder.desc),
      ),
    ];
