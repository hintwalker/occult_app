import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart'
    show Document, QuillController, QuillEditor, QuillToolbar;
// import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class NoteEditorWidget<T> extends StatefulWidget {
  const NoteEditorWidget({
    super.key,
    required this.translate,
    required this.colorScheme,
    this.uid,
    required this.note,
    required this.onChanged,
    required this.onSave,
    required this.toggleEditMode,
    required this.onHitMaxLength,
    this.maxLength = 235,
  });
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final String? uid;
  final NoteLike<T> note;
  final Future<void> Function(T note, String? uid) onChanged;
  final Future<void> Function(T note, String? uid) onSave;
  final void Function(bool) toggleEditMode;
  final void Function(int limit) onHitMaxLength;
  final int maxLength;

  @override
  State<StatefulWidget> createState() => _NoteEditorState<T>();
}

class _NoteEditorState<T> extends State<NoteEditorWidget<T>> {
  QuillController? _contentController;
  late final TextEditingController _titleController;
  final FocusNode _focusNode = FocusNode();
  bool readOnly = true;
  int contentLenght = 0;
  DateTime lastHitMaxLength = DateTime.now();
  @override
  void initState() {
    super.initState();
    setState(() {
      final content = jsonDecode(widget.note.noteContent);
      // final content = jsonDecode(r'[{"insert":"hello\n"}]');
      _contentController = QuillController(
          document: Document.fromJson(content),
          selection: const TextSelection.collapsed(offset: 0));
      // _contentController = QuillController.basic();
      contentLenght = _contentController!.document.length - 1;
      _contentController!.addListener(onContentChanged);
      _titleController = TextEditingController(text: widget.note.noteTitle);
      _titleController.addListener(onTitleChanged);
    });
  }

  void onTitleChanged() async {
    await widget.onChanged(
        widget.note.copyWithTitle(_titleController.text), widget.uid);
  }

  void onContentChanged() async {
    // final data = _contentController!.document.toDelta().toJson();

    // final stringData = jsonEncode(data);
    final documentString = _contentController!.document.toPlainText();

    int documentLength =
        documentString.length - 1; //_contentController!.document.length;

    if (documentLength > widget.maxLength) {
      _contentController?.undo();
      documentLength = _contentController!.document.toPlainText().length - 1;
      final now = DateTime.now();
      if (now.difference(lastHitMaxLength).inMilliseconds > 1000) {
        widget.onHitMaxLength(widget.maxLength);
        lastHitMaxLength = now;
      }

      // final latestIndex = widget.maxLength - 1;
      // _contentController?.replaceText(
      //   latestIndex,
      //   documentLength - widget.maxLength,
      //   '',
      //   TextSelection.collapsed(offset: latestIndex),
      // );
    }

    await widget.onChanged(
      widget.note.copyWithContent(
        jsonEncode(_contentController!.document.toDelta().toJson()),
      ),
      widget.uid,
    );
    setState(() {
      contentLenght = documentLength;
    });
  }

  Future<void> onSaveData() async {
    final data = _contentController!.document.toDelta().toJson();

    final stringData = jsonEncode(data);
    // final test = _contentController!.document.toPlainText().trim();
    await widget.onSave(
      widget.note.coppyWithTitleAndContent(
        title: _titleController.text,
        content: stringData,
        time: DateTime.now(),
      ),
      widget.uid,
    );
  }

  @override
  void dispose() {
    _contentController!.removeListener(onContentChanged);
    _titleController.removeListener(onTitleChanged);

    super.dispose();
  }

  Future<bool> onWillPop() async {
    await onSaveData();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: TextFormField(
                    controller: _titleController,
                    decoration:
                        InputDecoration(labelText: widget.translate('title')),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    maxLength: 30,
                    readOnly: readOnly,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )
                    // inputFormatters: [LengthLimitingTextInputFormatter(30)],
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                            color: widget.colorScheme.surfaceVariant,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0))),
                        child: Text(
                          '$contentLenght/${widget.maxLength}',
                          style: TextStyle(
                              color: widget.colorScheme.onSurfaceVariant,
                              fontSize: 16.0),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.white,
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.text,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 192.0),
                      child: QuillEditor(
                        controller: _contentController!,
                        focusNode: _focusNode,
                        scrollController: ScrollController(),
                        scrollable: false,
                        padding: EdgeInsets.zero,
                        autoFocus: false,
                        showCursor: !readOnly,
                        readOnly: readOnly,
                        enableSelectionToolbar: true,
                        expands: false,
                        placeholder: widget.translate('yourNoteHere'),
                      ),
                    ),
                  ),
                ),
              ),

              // ignore: avoid_unnecessary_containers
              Container(
                  child: Visibility(
                visible: !readOnly,
                child: QuillToolbar.basic(
                  toolbarIconSize: 22.0,
                  multiRowsDisplay: false,
                  controller: _contentController!,
                  showAlignmentButtons: true,
                  afterButtonPressed: _focusNode.requestFocus,
                  showFontFamily: false,
                ),
              )),
            ],
          ),
          Positioned(
              bottom: 72,
              right: 24,
              child: FloatingActionButton(
                backgroundColor: readOnly
                    ? widget.colorScheme.primaryContainer
                    : widget.colorScheme.tertiaryContainer,
                foregroundColor: readOnly
                    ? widget.colorScheme.onPrimaryContainer
                    : widget.colorScheme.onTertiaryContainer,
                onPressed: () {
                  if (!readOnly) {
                    onSaveData();
                  }
                  widget.toggleEditMode(readOnly);

                  setState(() {
                    readOnly = !readOnly;
                  });
                },
                child: Icon(
                  readOnly ? Icons.edit : Icons.done,
                ),
              ))
        ],
      ),
    );
  }
}
