import 'package:flutter/material.dart';

import '../../entity/star_item.dart';
import 'star_item_widget.dart';

class StarListWidget extends StatelessWidget {
  const StarListWidget({
    super.key,
    required this.data,
    required this.onItemTap,
    required this.translate,
  });
  final Iterable<StarItem> data;
  final void Function(StarItem) onItemTap;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => StarItemWidget(
        data.elementAt(index),
        onTap: onItemTap,
        translate: translate,
      ),
      separatorBuilder: (_, index) => const Divider(
        height: 1,
        thickness: 1,
      ),
      itemCount: data.length,
    );
  }
}
