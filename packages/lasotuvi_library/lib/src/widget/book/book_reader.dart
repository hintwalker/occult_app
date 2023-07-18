import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:lasotuvi_library/src/controller/book_reader_control_controller.dart';
import 'package:lasotuvi_library/src/widget/book/book_reader_control_widget.dart';
import '../../controller/book_reader_controller.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../entity/book_item.dart';

class BookReader extends StatefulWidget {
  const BookReader({
    super.key,
    required this.uid,
    required this.controller,
    required this.item,
    // required this.fileName,
  });
  final BookReaderController controller;
  final BookItem item;
  // final String fileName;
  final String uid;

  @override
  State<BookReader> createState() => _BookReaderState();
}

class _BookReaderState extends State<BookReader> {
  final Completer<PDFViewController> controllerCompleter =
      Completer<PDFViewController>();
  final bookReaderControlController = BookReaderControlController();
  @override
  Widget build(BuildContext context) {
    return BasicFutureBuilder(
      future: widget.controller.loadLocalFile(widget.uid, widget.item),
      child: (localFile) => Column(
        children: [
          FutureBuilder(
              future: controllerCompleter.future,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return BookReaderControlWidget(
                      controller: bookReaderControlController,
                      onNextPage: (value) async {
                        await snapshot.requireData.setPage(value);
                      },
                      onPreviousPage: (value) async {
                        await snapshot.requireData.setPage(value);
                      });
                } else {
                  return Container();
                }
              }),
          const SizedBox(
            height: 4.0,
          ),
          Expanded(
            child: FutureBuilder(
              future: widget.controller.getCurrentPage(
                uid: widget.uid,
                bookName: widget.item.name,
              ),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return PDFView(
                    defaultPage: snapshot.requireData,
                    filePath: localFile.path,
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: false,
                    pageFling: false,
                    onViewCreated: (event) =>
                        controllerCompleter.complete(event),
                    onPageChanged: onPageChanged,
                    onRender: onRender,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
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
