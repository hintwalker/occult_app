import 'package:flutter/material.dart';
import 'package:tauari_sort/tauari_sort.dart';

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
    required this.colorScheme,
    required this.translate,
    this.useStickyGroupSeparators = false,
    required this.order,
    this.sort = true,
    this.seperator,
  });
  final Iterable<U> data;
  final DataListController<U> controller;
  final Widget Function(U) itemBuilder;
  final Iterable<ActionButton<U>> actionButtons;
  final V Function(U) groupBy;
  final int Function(V, V) groupComparator;
  final Widget Function(V) groupSeperatorBuilder;
  final bool useStickyGroupSeparators;
  final ListOrder order;
  final bool sort;
  final Widget? seperator;
  final String Function(String) translate;
  final ColorScheme colorScheme;

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
    return Column(
      children: [
        if (!(widget.controller.sortOption == null ||
            widget.controller.sortOption!.name.isEmpty))
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(
                            color:
                                widget.colorScheme.outline.withOpacity(0.6)))),
                child: Text(
                  '${widget.translate('sortBy')}: ${widget.translate(widget.controller.sortOption!.name)}',
                  style: TextStyle(
                      color: widget.colorScheme.outline.withOpacity(0.6),
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        if (!(widget.controller.sortOption == null ||
            widget.controller.sortOption!.name.isEmpty))
          const SizedBox(
            height: 4.0,
          ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 12.0,
                top: 2.0,
                bottom: 2.0,
              ),
              decoration: BoxDecoration(
                color: widget.colorScheme.primaryContainer,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(18.0),
                  bottomLeft: Radius.circular(18.0),
                ),
              ),
              child: Text(
                '${widget.controller.foundData.length}',
                style: TextStyle(
                  fontSize: 16,
                  color: widget.colorScheme.primary,
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: DataListBodyWidget<U, V, U>(
            data: widget.controller.foundData,
            itemBuilder: (context, item) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
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
            order: widget.order,
            useStickyGroupSeparators: widget.useStickyGroupSeparators,
            seperator: widget.seperator,
          ),
        ),
      ],
    );
  }
}
