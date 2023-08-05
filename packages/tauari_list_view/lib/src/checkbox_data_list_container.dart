import 'package:flutter/material.dart';

import '../tauari_list_view.dart';

class CheckboxDataListContainer<U, V> extends StatefulWidget {
  const CheckboxDataListContainer({
    super.key,
    required this.data,
    required this.initSelected,
    required this.itemId,
    required this.controller,
    required this.itemBuilder,
    required this.groupBy,
    required this.groupComparator,
    required this.groupSeperatorBuilder,
    required this.colorScheme,
    required this.translate,
    this.useStickyGroupSeparators = false,
    // this.order = ListOrder.asc,
    this.sort = true,
  });

  final Iterable<U> data;
  final bool Function(U) initSelected;
  final int Function(U) itemId;
  final CheckboxDataListController<U> controller;
  final Widget Function(U) itemBuilder;

  final V Function(SelectableItem<U>) groupBy;
  final int Function(V, V) groupComparator;
  final Widget Function(V) groupSeperatorBuilder;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final bool useStickyGroupSeparators;
  // final ListOrder order;
  final bool sort;

  @override
  State<CheckboxDataListContainer> createState() =>
      _CheckboxDataListContainerState<U, V>();
}

class _CheckboxDataListContainerState<U, V>
    extends State<CheckboxDataListContainer<U, V>> {
  // List<SelectableItem<U>> selectableItems = [];
  // List<SelectableItem<U>> foundData = [];
  // List<SelectableItem<U>> selected = [];

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listenToController);
    widget.controller.setData(widget.data);
    // setState(() {
    //   selectableItems = widget.data
    //       .map((e) => SelectableItem(e,
    //           initSelected: widget.initSelected(e),
    //           selected: widget.initSelected(e)))
    //       .toList();
    //   foundData = selectableItems;
    // });
    // controller = TextEditingController();
  }

  @override
  void didUpdateWidget(covariant CheckboxDataListContainer<U, V> oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.controller.removeListener(listenToController);
    widget.controller.addListener(listenToController);
    widget.controller.setData(widget.data);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listenToController);
    super.dispose();
  }

  void listenToController() {
    setState(() {});
  }

  // @override
  // void didUpdateWidget(covariant CheckboxDataListContainer<U, V> oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   final inputData = widget.data
  //       .map((e) => SelectableItem(e,
  //           initSelected: widget.initSelected(e),
  //           selected: widget.initSelected(e)))
  //       .toList();
  //   final inputLen = inputData.length;

  //   for (var i = 0; i < inputLen; i++) {
  //     final inputi = inputData.elementAt(i);

  //     final oldi = selectableItems.where((element) {
  //       final isEquals = element.data.hashCode == inputi.data.hashCode;
  //       return isEquals;
  //     });
  //     if (oldi.isNotEmpty) {
  //       inputData.removeAt(i);
  //       final newItem = oldi.first.copyWith(data: inputi.data);
  //       inputData.insert(i, newItem);
  //     }
  //   }
  //   selectableItems = List.from(inputData);
  //   // final setOfSelectableItems = selectableItems.toSet();
  //   // final newOnes = inputData.difference(setOfSelectableItems);

  //   // selectableItems =
  //   //     setOfSelectableItems.union(newOnes).intersection(inputData).toList();
  //   foundData = selectableItems;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                          color: widget.colorScheme.outline.withOpacity(0.6)))),
              child: Text(
                widget
                    .translate('sortBy ${widget.controller.sortOption!.name}'),
                style: TextStyle(
                    color: widget.colorScheme.outline.withOpacity(0.6),
                    fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 4.0,
        ),
        Expanded(
          child: DataListBodyWidget<U, V, SelectableItem<U>>(
            data: widget.controller.foundData,
            itemBuilder: (context, item) => CheckBoxListItem<U>(
              item,
              child: widget.itemBuilder(item.data),
              onChanged: (checked) =>
                  widget.controller.onCheckChanged(item, checked),
              // {
              // final old = selected.where((element) =>
              //     widget.itemId(element.data) == widget.itemId(item.data));
              // if (old.isNotEmpty) {
              //   selected.remove(old.first);
              // }
              // selected.add(item.copyWith(selected: checked));
              // setState(() {
              //   final index = selectableItems.indexWhere(
              //     (element) =>
              //         widget.itemId(element.data) == widget.itemId(item.data),
              //   );
              //   selectableItems.removeAt(index);
              //   // selectableItems.removeWhere((element) =>
              //   //     widget.itemId(element.data) ==
              //   //     widget.itemId(item.data));
              //   selectableItems.insert(index, item.copyWith(selected: checked));
              // });
              // }
              // checked
              //     ? selected.add(item)
              //     : selected.remove(item),
            ),
            groupBy: widget.groupBy,
            groupComparator: widget.groupComparator,
            groupSeperatorBuilder: widget.groupSeperatorBuilder,
            sort: widget.sort,
            // order: widget.order,
            useStickyGroupSeparators: widget.useStickyGroupSeparators,
          ),
        ),
      ],
    );
  }
}
