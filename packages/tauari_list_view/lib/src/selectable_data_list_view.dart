import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:tauari_list_view/src/search_box_widget.dart';
import 'package:tauari_sort/tauari_sort.dart';

import 'checkbox_list_item.dart';
import 'selectable_item.dart';

class SelectableDataListView<U, V> extends StatefulWidget {
  const SelectableDataListView(
    this.data, {
    super.key,
    required this.groupBy,
    required this.groupComparator,
    required this.itemBuilder,
    required this.groupSeperatorBuilder,
    this.useStickyGroupSeparators = false,
    this.order = ListOrder.asc,
    required this.whereTest,
    required this.colorScheme,
    required this.translate,
    this.sort = true,
    required this.onCancel,
    required this.onSubmit,
    required this.initSelected,
    required this.itemId,
  });

  final Iterable<U> data;
  final V Function(U) groupBy;
  final int Function(V, V) groupComparator;
  final Widget Function(V) groupSeperatorBuilder;
  final bool useStickyGroupSeparators;
  final ListOrder order;
  final Widget Function(U) itemBuilder;
  final bool Function(U, String) whereTest;
  final String Function(String) translate;
  final bool sort;
  final void Function(BuildContext context, Iterable<SelectableItem<U>> charts)
      onSubmit;
  final void Function(BuildContext context) onCancel;
  final bool Function(U) initSelected;
  final int Function(U) itemId;
  final ColorScheme colorScheme;

  @override
  State<SelectableDataListView> createState() =>
      _SelectableDataListViewState<U, V>();
}

class _SelectableDataListViewState<U, V>
    extends State<SelectableDataListView<U, V>> {
  List<SelectableItem<U>> selectableItems = [];
  List<SelectableItem<U>> foundData = [];
  List<SelectableItem<U>> selected = [];
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      selectableItems = widget.data
          .map((e) => SelectableItem(e,
              id: widget.itemId(e),
              initSelected: widget.initSelected(e),
              selected: widget.initSelected(e)))
          .toList();
      foundData = selectableItems;
    });
    // controller = TextEditingController();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  @override
  void didUpdateWidget(covariant SelectableDataListView<U, V> oldWidget) {
    super.didUpdateWidget(oldWidget);
    final inputData = widget.data
        .map((e) => SelectableItem(e,
            id: widget.itemId(e),
            initSelected: widget.initSelected(e),
            selected: widget.initSelected(e)))
        .toList();
    final inputLen = inputData.length;

    for (var i = 0; i < inputLen; i++) {
      final inputi = inputData.elementAt(i);

      final oldi = selectableItems.where((element) {
        final isEquals = element.data.hashCode == inputi.data.hashCode;
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
  }

  // @override
  // void didUpdateWidget(covariant SelectableDataListView<U, V> oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   setState(() {
  //     selectableItems = widget.data
  //         .map((e) => SelectableItem(e,
  //             initSelected: widget.initSelected(e),
  //             selected: widget.initSelected(e)))
  //         .toList();
  //     foundData = selectableItems;
  //   });
  //   // controller = TextEditingController();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(children: [
            SearchBoxWidget(
                colorScheme: widget.colorScheme,
                translate: widget.translate,
                onSearch: _runFilter),
            // TextField(
            //   controller: controller,
            //   onChanged: _runFilter,
            //   decoration: InputDecoration(
            //     labelText: widget.translate('search'),
            //     prefixIcon: const Icon(Icons.search),
            //     suffixIcon: controller.text.isEmpty
            //         ? null
            //         : IconButton(
            //             icon: const Icon(Icons.close),
            //             onPressed: () {
            //               controller.clear();

            //               _runFilter('');
            //             },
            //           ),
            //   ),
            //   keyboardType: TextInputType.text,
            //   textInputAction: TextInputAction.search,
            // ),
            const SizedBox(
              height: 2.0,
            ),
            Expanded(
              //     child: ListView.builder(
              //   itemBuilder: (ctx, index) {
              //     return DataListItem<U>(foundData[index],
              //         index: index,
              //         buttons: widget.buttons,
              //         child: widget.itemBuilder(foundData[index]));
              //   },
              //   itemCount: foundData.length,
              // )
              child: SlidableAutoCloseBehavior(
                closeWhenOpened: true,
                child: GroupedListView<SelectableItem<U>, V>(
                  elements: foundData,
                  groupBy: (item) => widget.groupBy(item.data),
                  groupComparator: widget.groupComparator,
                  groupSeparatorBuilder: widget.groupSeperatorBuilder,
                  useStickyGroupSeparators: widget.useStickyGroupSeparators,
                  padding: const EdgeInsets.only(
                      left: 4, top: 4, right: 4, bottom: 92),
                  sort: widget.sort,
                  order: widget.order == ListOrder.asc
                      ? GroupedListOrder.ASC
                      : GroupedListOrder.DESC,
                  itemBuilder: (ctx, item) {
                    return CheckBoxListItem<U>(item,
                        child: widget.itemBuilder(item.data),
                        onChanged: (checked) {
                      final old = selected.where((element) =>
                          widget.itemId(element.data) ==
                          widget.itemId(item.data));
                      if (old.isNotEmpty) {
                        selected.remove(old.first);
                      }
                      selected.add(item.copyWith(selected: checked));
                      setState(() {
                        final index = selectableItems.indexWhere(
                          (element) =>
                              widget.itemId(element.data) ==
                              widget.itemId(item.data),
                        );
                        selectableItems.removeAt(index);
                        // selectableItems.removeWhere((element) =>
                        //     widget.itemId(element.data) ==
                        //     widget.itemId(item.data));
                        selectableItems.insert(
                            index, item.copyWith(selected: checked));
                      });
                    }
                        // checked
                        //     ? selected.add(item)
                        //     : selected.remove(item),
                        );
                  },
                  physics: const ClampingScrollPhysics(),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     TextButton(
            //       onPressed: () => widget.onCancel(context),
            //       child: Text(widget.translate('cancel')),
            //     ),
            //     const SizedBox(
            //       width: 24.0,
            //     ),
            //     ElevatedButton.icon(
            //         onPressed: () => widget.onSubmit(
            //               context,
            //               selected,
            //             ),
            //         icon: const Icon(Icons.done),
            //         label: const Text('OK'))
            //   ],
            // ),
            const SizedBox(
              height: 12.0,
            )
          ]),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Container(
              // padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                  color: widget.colorScheme.background,
                  // border: Border(
                  //   top: BorderSide(color: colorScheme.outline),
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: widget.colorScheme.outline,
                      offset: const Offset(0, 0),
                      spreadRadius: 12.0,
                      blurRadius: 5.0,
                    ),
                    BoxShadow(
                      color: widget.colorScheme.background,
                      offset: const Offset(0, 0),
                      spreadRadius: 10.0,
                      blurRadius: 0.0,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, right: 12.0, left: 12.0, bottom: 12.0),
                child: Row(
                  children: [
                    OutlinedButton.icon(
                        // style: FilledButton.styleFrom(
                        //     backgroundColor: widget.colorScheme.tertiary),
                        onPressed: () => widget.onCancel(context),
                        icon: const Icon(Icons.cancel),
                        label: Text(
                          widget.translate('cancel'),
                          // style: TextStyle(
                          //   color: widget.colorScheme.onTertiary,
                          // )
                        )),
                    const Spacer(),
                    FilledButton.icon(
                      onPressed: () => widget.onSubmit(
                        context,
                        selected,
                      ),
                      icon: const Icon(Icons.done),
                      label: const Text(
                        'OK',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _runFilter(String query) {
    List<SelectableItem<U>> result = [];
    if (query.isEmpty) {
      result = selectableItems;
    } else {
      result = selectableItems
          .where((e) => widget.whereTest(e.data, query))
          .toList();
    }
    setState(() {
      foundData = result;
    });
  }
}
