part of sunoom_calendar_input;

class DateNameField<T extends Enum> extends StatefulWidget {
  final DateNameController<T> controller;
  final T? defaultValue;
  final List<T> data;
  final String Function(String)? translate;
  const DateNameField(
    this.controller, {
    super.key,
    required this.defaultValue,
    required this.data,
    this.translate,
  });

  @override
  State<StatefulWidget> createState() => _DateNameFieldState();
}

class _DateNameFieldState<T extends Enum> extends State<DateNameField<T>> {
  late T? selected;
  @override
  void initState() {
    super.initState();
    setState(() {
      selected = widget.controller.selected ?? widget.defaultValue;
    });
    widget.controller.addListener(controllListener);
  }

  void controllListener() {
    setState(() {
      selected = widget.controller.selected;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(controllListener);
    super.dispose();
  }

  void openSelection() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return CanChiSelectionModal<T>(
            data: widget.data,
            onSelected: onSelected,
            previousSelected: selected,
            controller: GroupButtonController(
                selectedIndex:
                    selected == null ? null : widget.data.indexOf(selected!)),
          );
        });
  }

  void onSelected(T value) {
    setState(() {
      selected = value;
    });
    widget.controller.select(value);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: openSelection,
        style: ElevatedButton.styleFrom(
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
        ),
        child: Text(
          selected == null
              ? '-'
              : widget.translate != null
                  ? widget.translate!(selected!.name)
                  : selected!.name,
        ));
  }
}
