part of lasotuvi_presentation;

class NoteEditorBody extends ConsumerStatefulWidget {
  const NoteEditorBody(
    this.noteId, {
    super.key,
    required this.syncStatus,
  });
  final String noteId;
  final String syncStatus;

  @override
  ConsumerState<NoteEditorBody> createState() => _NoteEditorBodyState();
}

class _NoteEditorBodyState extends AuthDependedState<NoteEditorBody> {
  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const LoadingWidget()
        : NoteEditorBuilder(
            uid: uid,
            noteId: widget.noteId,
            syncStatus: RouterParams.getPathParamValue(widget.syncStatus),
            controller: ref.read(noteEditorControllerProvider),
            onWillPop: (note) => {},
            child: (note) => NoteEditorWidget(
                translate: translate,
                colorScheme: lightColorScheme,
                note: note,
                onChanged: (note, uid) async {},
                onSave: (note, uid) async {},
                toggleEditMode: (value) {},
                onHitMaxLength: (value) {}));
  }
}
