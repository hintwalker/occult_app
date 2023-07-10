import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_note/lasotuvi_note.dart';

import '../usecase/on_notes.dart';

final noteListControllerProvider =
    ChangeNotifierProvider.autoDispose<NoteListController>(
  (ref) => NoteListController(onSyncableData: ref.read(onNotesProvider)),
);
