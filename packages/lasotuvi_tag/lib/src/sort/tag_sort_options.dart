import 'package:flutter/material.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import 'tag_sort_value.dart';

Iterable<SortOption> tagSortOptions(String Function(String) translate) => [
      SortOption(
        icon: const Icon(Icons.text_fields),
        label: translate(TagSortValue.sortByTitleAsc),
        value: const SortValue(TagSortValue.sortByTitleAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.text_fields),
        label: translate(TagSortValue.sortByTitleDesc),
        value: const SortValue(TagSortValue.sortByTitleDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.create_new_folder_outlined),
        label: translate(TagSortValue.sortByCreatedDesc),
        value: const SortValue(TagSortValue.sortByCreatedDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.create_new_folder_outlined),
        label: translate(TagSortValue.sortByCreatedAsc),
        value: const SortValue(TagSortValue.sortByCreatedAsc, ListOrder.asc),
      ),
    ];
