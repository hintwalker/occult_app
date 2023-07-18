import 'package:flutter/material.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import '../book_list_modal_screen.dart';
import '../book_reader_modal_screen.dart';
import '../star_info_body.dart';
import '../star_list_modal_screen.dart';

class LibraryNavigation {
  static void showStarsScreen(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const StarListModalScreen(),
    );
  }

  static void showStarInfoViewer(BuildContext context, StarItem item) {
    showDialog(
      context: context,
      builder: (_) => StarInfoBody(item),
    );
  }

  static void showBooksScreen(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const BookListModalScreen(),
    );
  }

  static void showBookReader(BuildContext context, BookItem item) {
    showDialog(
      context: context,
      builder: (_) => Material(
        child: BookReaderModalScreen(item),
      ),
    );
  }
}
