import 'package:flutter/material.dart';

import '../../entity/book_item.dart';
import 'book_item_widget.dart';

class BookListWidget extends StatelessWidget {
  const BookListWidget({
    super.key,
    required this.data,
    required this.onItemTap,
    required this.translate,
  });
  final Iterable<BookItem> data;
  final void Function(BookItem) onItemTap;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => BookItemWidget(
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
