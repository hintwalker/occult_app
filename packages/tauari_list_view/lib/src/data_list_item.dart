import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'action_button.dart';

class DataListItem<T> extends StatelessWidget {
  const DataListItem(
    this.data, {
    super.key,
    required this.child,
    required this.buttons,
    this.slidable = true,
  });
  final T data;
  final Widget child;
  final Iterable<ActionButton<T>> buttons;
  final bool slidable;

  @override
  Widget build(BuildContext context) {
    // return Dismissible(
    //   key: Key(index.toString()),
    //   background: Container(
    //     color: Colors.green,
    //     child: Align(
    //       child: Padding(
    //         padding: const EdgeInsets.only(left: 16),
    //         child: Icon(Icons.favorite),
    //       ),
    //       alignment: Alignment.centerLeft,
    //     ),
    //   ),
    //   child: Text(
    //     index.toString(),
    //   ),
    // );
    return Slidable(
      enabled: slidable,
      key: ValueKey(data),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        // dismissible: DismissiblePane(onDismissed: () {}),

        children: buttons
            .map(
              (e) => SlidableAction(
                onPressed: (ctx) => e.onPressed(ctx, data),
                backgroundColor: e.background,
                foregroundColor: e.foreground,
                icon: e.icon,
                // label: e.label,
                autoClose: true,
              ),
            )
            .toList(),
      ),
      child: child,
    );
  }
}
