import 'package:flutter/material.dart';

class BookReaderControlController extends ChangeNotifier {
  int currentPage = 0;
  int totalPage = 0;

  int get currentPageDisplay => currentPage + 1;

  BookReaderControlController({
    this.currentPage = 0,
    this.totalPage = 0,
  });

  void setCurrentPage(int value) {
    currentPage = value;
    notifyListeners();
  }

  void setTotalPage(int value) {
    totalPage = value;
    notifyListeners();
  }

  void nextPage() {
    if (currentPage < totalPage) {
      currentPage = currentPage + 1;
      notifyListeners();
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      currentPage = currentPage - 1;
      notifyListeners();
    }
  }
}
