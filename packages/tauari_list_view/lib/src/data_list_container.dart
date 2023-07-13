import 'package:flutter/material.dart';

import '../tauari_list_view.dart';

class DataListContainer<U, V> extends StatefulWidget {
  const DataListContainer({
    super.key,
    required this.data,
    required this.controller,
    required this.itemBuilder,
    required this.actionButtons,
    required this.groupBy,
    required this.groupComparator,
    required this.groupSeperatorBuilder,
    this.useStickyGroupSeparators = false,
    // this.order = ListOrder.asc,
    this.sort = true,
  });
  final Iterable<U> data;
  final DataListController<U> controller;
  final Widget Function(U) itemBuilder;
  final Iterable<ActionButton<U>> actionButtons;
  final V Function(U) groupBy;
  final int Function(V, V) groupComparator;
  final Widget Function(V) groupSeperatorBuilder;
  final bool useStickyGroupSeparators;
  // final ListOrder order;
  final bool sort;

  @override
  State<DataListContainer<U, V>> createState() =>
      _DataListContainerState<U, V>();
}

class _DataListContainerState<U, V> extends State<DataListContainer<U, V>> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listenToController);
    widget.controller.setData(widget.data);
  }

  @override
  void didUpdateWidget(covariant DataListContainer<U, V> oldWidget) {
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

  @override
  Widget build(BuildContext context) {
    return DataListBodyWidget<U, V, U>(
      data: widget.controller.foundData,
      itemBuilder: (context, item) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: DataListItem<U>(
          item,
          buttons: widget.actionButtons,
          slidable: widget.actionButtons.isNotEmpty,
          child: widget.itemBuilder(item),
        ),
      ),
      groupBy: widget.groupBy,
      groupComparator: widget.groupComparator,
      groupSeperatorBuilder: widget.groupSeperatorBuilder,
      sort: widget.sort,
      // order: order,
      useStickyGroupSeparators: widget.useStickyGroupSeparators,
    );
  }
}
