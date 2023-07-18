import 'package:flutter/material.dart';

import '../../entity/book_item.dart';

class BookItemWidget extends StatelessWidget {
  const BookItemWidget(
    this.item, {
    super.key,
    required this.onTap,
    required this.translate,
  });
  final BookItem item;
  final void Function(BookItem) onTap;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        translate(item.label),
        style: const TextStyle(
          fontSize: 20.0,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(children: [
        Text(item.author),
        const Spacer(),
        Text('${item.page} ${translate('pages')}'),
      ]),
      // trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => onTap(item),
    );
  }
}
