import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart'
    show Document, QuillController;

class NoteItemContentWidget extends StatelessWidget {
  const NoteItemContentWidget(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    // final FocusNode focusNode = FocusNode();
    final content = jsonDecode(text);
    QuillController contentController = QuillController(
        document: Document.fromJson(content),
        selection: const TextSelection.collapsed(offset: 0));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      // child: QuillEditor(
      //   controller: contentController,
      //   focusNode: focusNode,
      //   scrollController: ScrollController(),
      //   scrollable: false,
      //   padding: EdgeInsets.zero,
      //   autoFocus: false,
      //   showCursor: false,
      //   readOnly: true,
      //   enableSelectionToolbar: false,
      //   expands: false,
      //   placeholder: '...',

      //   maxHeight: 340.0,
      // ),
      child: Row(
        children: [
          Text(
            contentController.document
                .getPlainText(0, contentController.document.length),
            style: const TextStyle(
              fontSize: 16,
            ),
            overflow: TextOverflow.fade,
            maxLines: 9,
          ),
        ],
      ),
    );
  }
}
