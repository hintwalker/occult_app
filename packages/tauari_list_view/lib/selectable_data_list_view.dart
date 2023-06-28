part of tauari_list_view;

class SelectableDataListView<U, V> extends StatefulWidget {
  const SelectableDataListView(
    this.data, {
    super.key,
    required this.groupBy,
    required this.itemBuilder,
    required this.groupSeperatorBuilder,
    this.useStickyGroupSeparators = false,
    this.order = ListOrder.asc,
    required this.whereTest,
    required this.translate,
    this.sort = false,
    required this.onCancel,
    required this.onSubmit,
  });

  final Iterable<U> data;
  final V Function(U) groupBy;
  final Widget Function(V) groupSeperatorBuilder;
  final bool useStickyGroupSeparators;
  final ListOrder order;
  final Widget Function(U) itemBuilder;
  final bool Function(U, String) whereTest;
  final String Function(String) translate;
  final bool sort;
  final void Function(BuildContext context, Iterable<U> charts) onSubmit;
  final void Function(BuildContext context) onCancel;

  @override
  State<SelectableDataListView> createState() =>
      _SelectableDataListViewState<U, V>();
}

class _SelectableDataListViewState<U, V>
    extends State<SelectableDataListView<U, V>> {
  List<SelectableItem<U>> selectableItems = [];
  List<SelectableItem<U>> foundData = [];
  List<U> selected = [];
  late final TextEditingController controller;
  @override
  void initState() {
    selectableItems =
        widget.data.map((e) => SelectableItem(e, selected: false)).toList();
    foundData = selectableItems;
    controller = TextEditingController();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SelectableDataListView<U, V> oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      selectableItems =
          widget.data.map((e) => SelectableItem(e, selected: false)).toList();
      foundData = selectableItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: controller,
        onChanged: _runFilter,
        decoration: InputDecoration(
            labelText: widget.translate('search'),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: controller.text.trim().isEmpty
                ? null
                : const Icon(Icons.close)),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
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
            groupSeparatorBuilder: widget.groupSeperatorBuilder,
            useStickyGroupSeparators: widget.useStickyGroupSeparators,
            padding:
                const EdgeInsets.only(left: 4, top: 4, right: 4, bottom: 92),
            sort: widget.sort,
            order: widget.order == ListOrder.asc
                ? GroupedListOrder.ASC
                : GroupedListOrder.DESC,
            itemBuilder: (ctx, item) {
              return CheckBoxListItem<U>(
                item,
                child: widget.itemBuilder(item.data),
                onChanged: (checked) => checked
                    ? selected.add(item.data)
                    : selected.remove(item.data),
              );
            },
            physics: const ClampingScrollPhysics(),
          ),
        ),
      ),
      const SizedBox(
        height: 8.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => widget.onCancel(context),
            child: Text(widget.translate('cancel')),
          ),
          const SizedBox(
            width: 24.0,
          ),
          ElevatedButton.icon(
              onPressed: () => widget.onSubmit(
                    context,
                    selected,
                  ),
              icon: const Icon(Icons.done),
              label: const Text('OK'))
        ],
      ),
      const SizedBox(
        height: 12.0,
      )
    ]);
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
