import 'package:flutter/material.dart';
import 'package:tauari_list_view/src/selectable_item.dart';

class CheckBoxListItem<T> extends StatefulWidget {
  const CheckBoxListItem(
    this.data, {
    super.key,
    required this.child,
    required this.onChanged,
  });

  final SelectableItem<T> data;
  final Widget child;
  final void Function(bool checked) onChanged;

  @override
  State<CheckBoxListItem> createState() => _CheckBoxListItemState();
}

class _CheckBoxListItemState extends State<CheckBoxListItem> {
  bool checked = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      checked = widget.data.selected;
    });
  }

  @override
  void didUpdateWidget(covariant CheckBoxListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      checked = widget.data.selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: checked,
            onChanged: (value) {
              widget.onChanged(value ?? false);
              setState(() {
                checked = value ?? false;
              });
            }),
        Expanded(child: widget.child),
      ],
    );
  }
}
