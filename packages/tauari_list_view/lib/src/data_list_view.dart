import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grouped_list/grouped_list.dart';

import 'action_button.dart';
import 'data_list_item.dart';
import 'list_order.dart';

class DataListView<U, V> extends StatefulWidget {
  const DataListView(
    this.data, {
    super.key,
    required this.groupBy,
    required this.itemBuilder,
    required this.groupSeperatorBuilder,
    this.useStickyGroupSeparators = false,
    this.order = ListOrder.asc,
    required this.buttons,
    required this.whereTest,
    required this.translate,
    this.sort = false,
    this.slidable = true,
  });
  final Iterable<U> data;
  final V Function(U) groupBy;
  final Widget Function(V) groupSeperatorBuilder;
  final bool useStickyGroupSeparators;
  final ListOrder order;
  final Widget Function(U) itemBuilder;
  final Iterable<ActionButton<U>> buttons;
  final bool Function(U, String) whereTest;
  final String Function(String) translate;
  final bool sort;
  final bool slidable;

  @override
  State<StatefulWidget> createState() => _DataListViewState<U, V>();
}

class _DataListViewState<U, V> extends State<DataListView<U, V>> {
  List<U> foundData = [];
  late final TextEditingController controller;

  @override
  void initState() {
    foundData = widget.data.toList();
    controller = TextEditingController();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DataListView<U, V> oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      foundData = widget.data.toList();
    });
  }

  void _runFilter(String query) {
    List<U> result = [];
    if (query.isEmpty) {
      result = widget.data.toList();
    } else {
      result = widget.data.where((e) => widget.whereTest(e, query)).toList();
    }
    setState(() {
      foundData = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: _runFilter,
              decoration: InputDecoration(
                labelText: widget.translate('search'),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: controller.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          controller.clear();

                          _runFilter('');
                        },
                      ),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.sort,
            ),
          )
        ],
      ),
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
          child: GroupedListView<U, V>(
            elements: foundData,
            groupBy: widget.groupBy,
            groupSeparatorBuilder: widget.groupSeperatorBuilder,
            useStickyGroupSeparators: widget.useStickyGroupSeparators,
            padding:
                const EdgeInsets.only(left: 4, top: 4, right: 4, bottom: 92),
            sort: widget.sort,
            order: widget.order == ListOrder.asc
                ? GroupedListOrder.ASC
                : GroupedListOrder.DESC,
            itemBuilder: (ctx, item) {
              return DataListItem<U>(
                item,
                buttons: widget.buttons,
                slidable: widget.slidable,
                child: widget.itemBuilder(item),
              );
            },
            physics: const ClampingScrollPhysics(),
          ),
        ),
      ),
    ]);
  }
}
