import 'package:flutter/material.dart';
import '../entity/book_item.dart';
import '../usecase/take_all_book_list.dart';

class BookListController extends ChangeNotifier {
  BookListController(this.takeAllBookMenu);
  final TakeAllBookList takeAllBookMenu;

  Future<Iterable<BookItem>> allData() => takeAllBookMenu();
}
