import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tauari_sort/tauari_sort.dart';
import 'package:tauari_utils/tauari_utils.dart';
import '../constant/item_selected_box_name.dart';
import '../selectable_item.dart';

class CheckboxDataListController<U> extends ChangeNotifier {
  CheckboxDataListController({
    required this.whereTest,
    // required this.groupBy,
    required this.initSelected,
    required this.itemId,
    required this.sortOption,
    required this.itemComparator,
    required this.onSaveSortOption,
  });

  static const cacheKey = 'selected';

  List<SelectableItem<U>> selectableItems = [];
  List<SelectableItem<U>> foundData = [];
  List<SelectableItem<U>> selected = [];

  final int Function(U) itemId;
  final bool Function(U) initSelected;
  final bool Function(U item, String query) whereTest;
  final int Function(
    SelectableItem<U>,
    SelectableItem<U>,
    SortValue? sortOption,
  ) itemComparator;
  // final V Function(SelectableItem<U> item, SortOption sortOption) groupBy;
  SortValue? sortOption;
  final void Function(SortValue sortOption) onSaveSortOption;

  void setSortOption(SortValue sortOption) {
    this.sortOption = sortOption;
    onSaveSortOption(sortOption);
    notifyListeners();
  }

  List<dynamic> getCache() {
    final box = Hive.box<List<dynamic>>(itemSelectedBoxName);
    final selectedCached = box.get(cacheKey);
    return selectedCached ?? [];
  }

  void initial(Iterable<U> data) {
    final cache = getCache();

    selectableItems = data
        .map((e) => SelectableItem(e,
            id: itemId(e),
            initSelected: initSelected(e),
            selected: initSelected(e)))
        .toList();
    foundData = selectableItems;
    foundData.sort(
      (e1, e2) => itemComparator(
        e1,
        e2,
        sortOption,
      ),
    );
    for (var i = 0; i < selectableItems.length; i++) {
      final item = selectableItems[i];
      try {
        final cacheItem = cache.firstWhere(
          (element) => element['id'] as int == item.id,
        );
        final copied = item.copyWith(
          selected: cacheItem['selected'] as bool,
        );
        selectableItems.update(
          i,
          copied,
        );
        selected = [...selected, copied];
        notifyListeners();
      } on StateError catch (_) {}
    }
  }

  void setData(Iterable<U> data) {
    selectableItems = data
        .map((e) => SelectableItem(e,
            id: itemId(e),
            initSelected: initSelected(e),
            selected: initSelected(e)))
        .toList();
    foundData = selectableItems;
    foundData.sort(
      (e1, e2) => itemComparator(
        e1,
        e2,
        sortOption,
      ),
    );
    notifyListeners();
  }

  void runFilter(String query) {
    if (query.isEmpty) {
      foundData = selectableItems;
    } else {
      foundData = selectableItems
          .where((e) => whereTest(
                e.data,
                query,
              ))
          .toList();
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

  void updateData(Iterable<U> newData) {
    final inputData = newData
        .map((e) => SelectableItem(e,
            id: itemId(e),
            initSelected: initSelected(e),
            selected: initSelected(e)))
        .toList();
    final inputLen = inputData.length;

    for (var i = 0; i < inputLen; i++) {
      final inputi = inputData.elementAt(i);

      final oldi = selectableItems.where((element) {
        final isEquals = element.data == inputi.data;
        return isEquals;
      });
      if (oldi.isNotEmpty) {
        inputData.removeAt(i);
        final newItem = oldi.first.copyWith(data: inputi.data);
        inputData.insert(i, newItem);
      }
    }
    selectableItems = List.from(inputData);
    // final setOfSelectableItems = selectableItems.toSet();
    // final newOnes = inputData.difference(setOfSelectableItems);

    // selectableItems =
    //     setOfSelectableItems.union(newOnes).intersection(inputData).toList();
    foundData = selectableItems;
    foundData.sort(
      (e1, e2) => itemComparator(
        e1,
        e2,
        sortOption,
      ),
    );
    notifyListeners();
  }

  void onCheckChanged(SelectableItem<U> item, bool checked) {
    final old =
        selected.where((element) => itemId(element.data) == itemId(item.data));
    if (old.isNotEmpty) {
      selected.remove(old.first);
    }
    selected.add(item.copyWith(selected: checked));
    // setState(() {
    final index = selectableItems.indexWhere(
      (element) => itemId(element.data) == itemId(item.data),
    );
    selectableItems.removeAt(index);
    // selectableItems.removeWhere((element) =>
    //     widget.itemId(element.data) ==
    //     widget.itemId(item.data));
    selectableItems.insert(index, item.copyWith(selected: checked));
    saveCache(selected);
    // });
    // notifyListeners();
  }

  void saveCache(List<SelectableItem<U>> list) {
    final box = Hive.box<List<dynamic>>(itemSelectedBoxName);
    box.put(
      cacheKey,
      list
          .map((e) => {
                'id': e.id,
                'initSelected': e.initSelected,
                'selected': e.selected,
              })
          .toList(),
    );
  }

  static Future<void> clearCache() async {
    final box = Hive.box<List<dynamic>>(itemSelectedBoxName);
    await box.clear();
  }

  @override
  void dispose() {
    clearCache();
    super.dispose();
  }
}
