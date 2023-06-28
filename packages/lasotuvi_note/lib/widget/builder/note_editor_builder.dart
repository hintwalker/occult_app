part of lasotuvi_note;

class NoteEditorBuilder extends StatelessWidget {
  const NoteEditorBuilder({
    super.key,
    required this.onWillPop,
  });
  final void Function(Note note) onWillPop;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
