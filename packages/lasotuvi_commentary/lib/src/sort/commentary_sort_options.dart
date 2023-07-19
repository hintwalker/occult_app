import 'package:flutter/material.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import 'commentary_sort_value.dart';

Iterable<SortOption> commentarySortOptions(String Function(String) translate) =>
    [
      SortOption(
        icon: const Icon(Icons.edit),
        label: translate(CommentarySortValue.sortByEditedDesc),
        value: const SortValue(
            CommentarySortValue.sortByEditedDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.edit),
        label: translate(CommentarySortValue.sortByEditedAsc),
        value:
            const SortValue(CommentarySortValue.sortByEditedAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.create_new_folder_outlined),
        label: translate(CommentarySortValue.sortByCreatedAsc),
        value: const SortValue(
            CommentarySortValue.sortByCreatedAsc, ListOrder.asc),
      ),
      SortOption(
        icon: const Icon(Icons.create_new_folder_outlined),
        label: translate(CommentarySortValue.sortByCreatedDesc),
        value: const SortValue(
            CommentarySortValue.sortByCreatedDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.text_fields),
        label: translate(CommentarySortValue.sortByTitleDesc),
        value: const SortValue(
            CommentarySortValue.sortByTitleDesc, ListOrder.desc),
      ),
      SortOption(
        icon: const Icon(Icons.text_fields),
        label: translate(CommentarySortValue.sortByTitleAsc),
        value:
            const SortValue(CommentarySortValue.sortByTitleAsc, ListOrder.asc),
      ),
    ];
