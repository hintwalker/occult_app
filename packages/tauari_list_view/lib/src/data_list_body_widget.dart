import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grouped_list/grouped_list.dart';

import '../tauari_list_view.dart';

class DataListBodyWidget<U, V, W> extends StatelessWidget {
  const DataListBodyWidget({
    super.key,
    required this.data,
    required this.itemBuilder,
    required this.groupBy,
    required this.groupComparator,
    required this.groupSeperatorBuilder,
    this.order = ListOrder.asc,
    this.sort = true,
    this.useStickyGroupSeparators = false,
  });

  final List<W> data;
  final Widget Function(BuildContext, W) itemBuilder;
  final V Function(W) groupBy;
  final int Function(V, V) groupComparator;
  final Widget Function(V) groupSeperatorBuilder;
  final bool useStickyGroupSeparators;
  final ListOrder order;
  final bool sort;

  @override
  Widget build(BuildContext context) {
    return SlidableAutoCloseBehavior(
      closeWhenOpened: true,
      child: GroupedListView<W, V>(
        elements: data,
        groupBy: (item) => groupBy(item),
        groupComparator: groupComparator,
        groupSeparatorBuilder: groupSeperatorBuilder,
        useStickyGroupSeparators: useStickyGroupSeparators,
        padding:
            const EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 128.0),
        sort: sort,
        order: order == ListOrder.asc
            ? GroupedListOrder.ASC
            : GroupedListOrder.DESC,
        itemBuilder: itemBuilder,

        // {
        //   return CheckBoxListItem<U>(item,
        //       child: widget.itemBuilder(item.data),
        //       onChanged: (checked) {
        //     final old = selected.where((element) =>
        //         widget.itemId(element.data) ==
        //         widget.itemId(item.data));
        //     if (old.isNotEmpty) {
        //       selected.remove(old.first);
        //     }
        //     selected.add(item.copyWith(selected: checked));
        //     setState(() {
        //       final index = selectableItems.indexWhere(
        //         (element) =>
        //             widget.itemId(element.data) ==
        //             widget.itemId(item.data),
        //       );
        //       selectableItems.removeAt(index);
        //       // selectableItems.removeWhere((element) =>
        //       //     widget.itemId(element.data) ==
        //       //     widget.itemId(item.data));
        //       selectableItems.insert(
        //           index, item.copyWith(selected: checked));
        //     });
        //   }
        //       // checked
        //       //     ? selected.add(item)
        //       //     : selected.remove(item),
        //       );
        // },
        physics: const ClampingScrollPhysics(),
      ),
    );
  }
}
