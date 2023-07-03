part of '../../main.dart';

class NoteEditorScreen extends StatelessWidget {
  const NoteEditorScreen({
    super.key,
    required this.restorationId,
    required this.noteId,
    required this.syncStatus,
  });

  final String? restorationId;
  // final String chartId;
  final String noteId;
  final String syncStatus;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
        restorationId: restorationId,
        child: Scaffold(
          appBar: AppBar(),
          body: NoteEditorBody(
            noteId,
            syncStatus: syncStatus,
          ),
        ));
  }
}
