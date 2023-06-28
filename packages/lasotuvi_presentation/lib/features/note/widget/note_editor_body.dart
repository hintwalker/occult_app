part of lasotuvi_presentation;

class NoteEditorBody extends ConsumerStatefulWidget {
  const NoteEditorBody({super.key});

  @override
  ConsumerState<NoteEditorBody> createState() => _NoteEditorBodyState();
}

class _NoteEditorBodyState extends AuthDependedState<NoteEditorBody> {
  @override
  Widget build(BuildContext context) {
    return NoteEditorBuilder(onWillPop: (note) => {});
  }
}
