part of '../../main.dart';

class NoteEditorScreen extends StatelessWidget {
  const NoteEditorScreen({
    super.key,
    this.restorationId,
    required this.noteId,
  });

  final String? restorationId;
  // final String chartId;
  final String noteId;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
      restorationId: restorationId,
      child: const NoteEditorBody(),
    );
  }
}
