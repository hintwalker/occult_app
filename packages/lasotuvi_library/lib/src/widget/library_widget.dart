import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'library_item_widget.dart';

class LibraryWidget extends UniversalWidget {
  const LibraryWidget({
    super.key,
    required this.onOpenStarsSceen,
    required this.onOpenBooksScreen,
    required this.onOpenTuHoaScreen,
    required super.translate,
  });
  final void Function() onOpenStarsSceen;
  final void Function() onOpenBooksScreen;
  final void Function() onOpenTuHoaScreen;

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
        LibraryItemWidget(
          title: translate('tuHoa'),
          onTap: onOpenTuHoaScreen,
          backgroundImage: 'assets/images/tu_hoa.png',
        ),
      ],
    );
  }
}
