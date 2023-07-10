import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_note/lasotuvi_note.dart';

import '../usecase/on_note_by_id.dart';

final noteEditorControllerProvider =
    ChangeNotifierProvider.autoDispose<NoteEditorController>(
  (ref) => NoteEditorController(
    onSyncableData: ref.read(onNoteByIdProvider),
  ),
);
