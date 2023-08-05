import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../controller/book_reader_control_controller.dart';
import '../../controller/book_reader_controller.dart';
import '../../entity/book_item.dart';
import 'book_reader_control_widget.dart';

class BookReader extends StatefulWidget {
  const BookReader({
    super.key,
    required this.uid,
    required this.controller,
    required this.item,
    required this.colorScheme,
    required this.file,
  });
  final BookReaderController controller;
  final BookItem item;
  final ColorScheme colorScheme;
  final String uid;
  final File file;

  @override
  State<BookReader> createState() => _BookReaderState();
}

class _BookReaderState extends State<BookReader> {
  final bookReaderControlController = BookReaderControlController();
  final Completer<PDFViewController> controllerCompleter =
      Completer<PDFViewController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasicFutureBuilder(
          future: controllerCompleter.future,
          child: (pdfViewController) => pdfViewController == null
              ? const SizedBox.shrink()
              : BookReaderControlWidget(
                  controller: bookReaderControlController,
                  onNextPage: (value) async {
                    await pdfViewController.setPage(value);
                  },
                  onPreviousPage: (value) async {
                    await pdfViewController.setPage(value);
                  }),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Expanded(
          child: BasicFutureBuilder(
              future: widget.controller.getCurrentPage(
                uid: widget.uid,
                bookName: widget.item.name,
              ),
              child: (currentPage) => PDFView(
                    defaultPage: currentPage ?? 0,
                    filePath: widget.file.path,
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: false,
                    pageFling: false,
                    onViewCreated: (event) =>
                        controllerCompleter.complete(event),
                    onPageChanged: onPageChanged,
                    onRender: onRender,
                  )),
        ),
      ],
    );
  }

  void onRender(int? pages) {
    if (bookReaderControlController.totalPage != pages) {
      bookReaderControlController.setTotalPage(pages ?? 0);
    }
  }

  void onPageChanged(int? page, int? total) async {
    if (bookReaderControlController.currentPage != page) {
      bookReaderControlController.setCurrentPage(page ?? 0);
    }
    widget.controller.saveCurrentPage(
      uid: widget.uid,
      bookName: widget.item.name,
      currentPage: bookReaderControlController.currentPage,
    );
  }
}
