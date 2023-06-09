import 'package:flutter/material.dart';

import '../entity/star_menu_item.dart';

class StarListItemWidget extends StatelessWidget {
  const StarListItemWidget(this.item, {super.key});
  final StarMenuItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
