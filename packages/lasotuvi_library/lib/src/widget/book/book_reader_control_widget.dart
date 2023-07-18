import 'package:flutter/material.dart';
import '../../controller/book_reader_control_controller.dart';

class BookReaderControlWidget extends StatefulWidget {
  const BookReaderControlWidget({
    super.key,
    required this.controller,
    required this.onNextPage,
    required this.onPreviousPage,
  });
  final BookReaderControlController controller;
  final void Function(int) onNextPage;
  final void Function(int) onPreviousPage;

  @override
  State<StatefulWidget> createState() => _BookReaderControlState();
}

class _BookReaderControlState extends State<BookReaderControlWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listenToController);
  }

  void listenToController() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              widget.onPreviousPage(widget.controller.currentPage - 1);
              widget.controller.previousPage();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 4.0,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(12.0)),
          child: Text(
              '${widget.controller.currentPage} / ${widget.controller.totalPage}'),
        ),
        IconButton(
            onPressed: () {
              widget.onPreviousPage(widget.controller.currentPage + 1);
              widget.controller.nextPage();
            },
            icon: const Icon(Icons.arrow_forward_ios)),
      ],
    );
  }
}
