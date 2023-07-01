part of lasotuvi_note;

class NoteEditorBuilder extends StatelessWidget {
  const NoteEditorBuilder({
    super.key,
    this.uid,
    required this.noteId,
    required this.controller,
    required this.onWillPop,
    required this.child,
  });
  final String? uid;
  final String noteId;
  final NoteEditorController controller;
  final void Function(Note note) onWillPop;
  final Widget Function(Note note) child;

  @override
  Widget build(BuildContext context) {
    final docId = int.tryParse(noteId);
    return docId == null
        ? const ErrorTextWidget()
        : StreamBuilder(
            stream: controller.stream(uid: uid, docId: docId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              } else if (snapshot.hasData) {
                final note = snapshot.requireData;
                if (note == null) {
                  return const ErrorTextWidget();
                } else {
                  return child(note);
                }
              } else {
                return const ErrorTextWidget();
              }
            });
  }
}
