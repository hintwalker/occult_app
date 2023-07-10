import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/note.dart';
import '../repository/note_repository.dart';

class SyncNotes extends SyncData<Note, NoteRepository> {
  SyncNotes(super.repository);
}
