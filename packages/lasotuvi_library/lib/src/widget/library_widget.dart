import 'package:flutter/material.dart';
import 'library_item_widget.dart';

class LibraryWidget extends StatelessWidget {
  const LibraryWidget({
    super.key,
    required this.onOpenStarsSceen,
    required this.onOpenBooksScreen,
    required this.translate,
  });
  final void Function() onOpenStarsSceen;
  final void Function() onOpenBooksScreen;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 12.0,
        bottom: 24.0,
      ),
      crossAxisCount: 2,
      mainAxisSpacing: 24.0,
      crossAxisSpacing: 24.0,
      children: [
        LibraryItemWidget(
          title: translate('stars'),
          onTap: onOpenStarsSceen,
          backgroundImage: 'assets/images/stars.jpg',
        ),
        LibraryItemWidget(
          title: translate('books'),
          onTap: onOpenBooksScreen,
          backgroundImage: 'assets/images/books.jpg',
        ),
      ],
    );
  }
}
