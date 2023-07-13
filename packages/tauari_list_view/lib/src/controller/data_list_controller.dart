import 'package:flutter/material.dart';
import '../entity/sort_value.dart';

class DataListController<U> extends ChangeNotifier {
  DataListController({
    required this.whereTest,
    required this.sortOption,
    required this.itemComparator,
    required this.onSaveSortOption,
  });
  final bool Function(U, String) whereTest;
  final int Function(U, U, SortValue? sortOption) itemComparator;
  final void Function(SortValue) onSaveSortOption;
  SortValue? sortOption;
  List<U> data = [];

  List<U> foundData = [];

  void setSortOption(SortValue sortOption) {
    this.sortOption = sortOption;
    foundData.sort(
      (e1, e2) => itemComparator(
        e1,
        e2,
        sortOption,
      ),
    );
    onSaveSortOption(sortOption);
    notifyListeners();
  }

  void setData(Iterable<U> data) {
    this.data = data.toList();
    foundData = this.data;
    notifyListeners();
  }

  void runFilter(String query) {
    if (query.isEmpty) {
      foundData = data;
    } else {
      foundData = data.where((e) => whereTest(e, query)).toList();
    }
    foundData.sort(
      (e1, e2) => itemComparator(
        e1,
        e2,
        sortOption,
      ),
    );
    notifyListeners();
  }
}
