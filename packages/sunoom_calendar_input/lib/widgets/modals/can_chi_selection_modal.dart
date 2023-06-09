import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class CanChiSelectionModal<T extends Enum> extends StatelessWidget {
  const CanChiSelectionModal({
    super.key,
    required this.data,
    required this.onSelected,
    required this.previousSelected,
    required this.controller,
    this.colorScheme,
    this.translate,
  });
  // {
  //   controller = GroupButtonController(
  //       selectedIndex:
  //           previousSelected == null ? null : data.indexOf(previousSelected!));
  // }
  final T? previousSelected;
  final List<T> data;
  final GroupButtonController controller;
  final void Function(T) onSelected;
  final ColorScheme? colorScheme;
  final String Function(String)? translate;

  void onPressed(T value, BuildContext context) {
    onSelected(value);
    controller.selectIndex(data.indexOf(value));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: GroupButton(
          controller: controller,
          isRadio: true,
          buttons: data,
          buttonBuilder: (selected, value, context) {
            return selected
                ? ElevatedButton(
                    onPressed: () => onPressed(value, context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme != null
                            ? colorScheme!.primaryContainer
                            : null),
                    child: Text(translate != null
                        ? translate!(value.name)
                        : value.name),
                  )
                : TextButton(
                    onPressed: () => onPressed(value, context),
                    child: Text(translate != null
                        ? translate!(value.name)
                        : value.name));
          },
        ),
      ),
    );
  }
}
