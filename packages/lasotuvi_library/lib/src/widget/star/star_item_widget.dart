import 'package:flutter/material.dart';

import '../../entity/star_item.dart';

class StarItemWidget extends StatelessWidget {
  const StarItemWidget(
    this.item, {
    super.key,
    required this.onTap,
    required this.translate,
  });
  final StarItem item;
  final void Function(StarItem) onTap;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(translate(item.label),
          style: const TextStyle(
            fontSize: 20.0,
          )),
      // trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => onTap(item),
    );
  }
}
