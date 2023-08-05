import 'package:flutter/material.dart';
import 'package:lasotuvi_library/src/widget/book/book_reader.dart';
import 'package:tauari_utils/tauari_utils.dart';
import '../../controller/book_reader_controller.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../entity/book_item.dart';

class BookReaderContainer extends StatefulWidget {
  const BookReaderContainer({
    super.key,
    required this.uid,
    required this.controller,
    required this.item,
    required this.colorScheme,
    required this.translate,
    // required this.fileName,
  });
  final BookReaderController controller;
  final BookItem item;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  // final String fileName;
  final String uid;

  @override
  State<BookReaderContainer> createState() => _BookReaderContainerState();
}

class _BookReaderContainerState extends State<BookReaderContainer> {
  bool? connected;
  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  void checkConnection() async {
    final result = await availableNetwork();
    setState(() {
      connected = result;
    });
  }

  // final bookReaderControlController = BookReaderControlController();
  @override
  Widget build(BuildContext context) {
    return connected == null
        ? const LoadingWidget()
        : connected == false
            ? BasicFutureBuilder(
                future: widget.controller.loadLocalBook(
                  widget.uid,
                  widget.item,
                ),
                child: (localFile) => localFile == null
                    ? NoConnectionErrorText(
                        translate: widget.translate,
                        textColor: widget.colorScheme.error,
                      )
                    : BookReader(
                        uid: widget.uid,
                        controller: widget.controller,
                        item: widget.item,
                        colorScheme: widget.colorScheme,
                        file: localFile,
                      ),
              )
            : BasicFutureBuilder(
                future: widget.controller.downloadBook(widget.uid, widget.item),
                child: (downloadedFile) => downloadedFile == null
                    ? DownloadFailedErrorText(
                        translate: widget.translate,
                        textColor: widget.colorScheme.error,
                      )
                    : BookReader(
                        uid: widget.uid,
                        controller: widget.controller,
                        item: widget.item,
                        colorScheme: widget.colorScheme,
                        file: downloadedFile,
                      ),
              );
  }
}
