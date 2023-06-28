part of lasotuvi_note;

class NoteEditorWidget extends StatefulWidget {
  const NoteEditorWidget(
      {super.key,
      required this.translate,
      required this.colorScheme,
      this.uid,
      required this.note,
      required this.onChanged,
      required this.onSave,
      required this.toggleEditMode,
      required this.onHitMaxLength,
      this.maxLength = 235});
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final String? uid;
  final Note note;
  final Future<void> Function(Note note, String? uid) onChanged;
  final Future<void> Function(Note note, String? uid) onSave;
  final void Function(bool) toggleEditMode;
  final void Function(int limit) onHitMaxLength;
  final int maxLength;

  @override
  State<StatefulWidget> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditorWidget> {
  QuillController? _contentController;
  late final TextEditingController _titleController;
  final FocusNode _focusNode = FocusNode();
  bool readOnly = true;
  int contentLenght = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      final content = jsonDecode(widget.note.content);
      // final content = jsonDecode(r'[{"insert":"hello\n"}]');
      _contentController = QuillController(
          document: Document.fromJson(content),
          selection: const TextSelection.collapsed(offset: 0));
      // _contentController = QuillController.basic();
      contentLenght = _contentController!.document.toPlainText().length;
      _contentController!.addListener(onContentChanged);
      _titleController = TextEditingController(text: widget.note.title);
      _titleController.addListener(onTitleChanged);
    });
  }

  void onTitleChanged() async {
    await widget.onChanged(
        widget.note.copyWith(title: _titleController.text), widget.uid);
  }

  void onContentChanged() async {
    final data = _contentController!.document.toDelta().toJson();

    final stringData = jsonEncode(data);
    final documentLength = _contentController!.document.length;

    if (documentLength > widget.maxLength) {
      _contentController?.undo();
      widget.onHitMaxLength(widget.maxLength);
      // final latestIndex = widget.maxLength - 1;
      // _contentController?.replaceText(
      //   latestIndex,
      //   documentLength - widget.maxLength,
      //   '',
      //   TextSelection.collapsed(offset: latestIndex),
      // );
    }

    await widget.onChanged(
      widget.note.copyWith(
        content: stringData,
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
    await widget.onSave(
      widget.note.copyWith(
        title: _titleController.text,
        content: stringData,
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
                  decoration: const InputDecoration(labelText: 'title'),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  maxLength: 30,
                  readOnly: readOnly,
                  // inputFormatters: [LengthLimitingTextInputFormatter(30)],
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.white,
                  padding: const EdgeInsets.only(left: 16, right: 16),
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
                        placeholder: 'yourNoteHere',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                            color: widget.colorScheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Text(
                          contentLenght.toString(),
                          style: TextStyle(
                              color: widget.colorScheme.onSurfaceVariant),
                        )),
                  ],
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
