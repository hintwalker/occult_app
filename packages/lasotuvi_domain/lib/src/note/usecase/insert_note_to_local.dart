import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/note.dart';
import '../repository/local_note_repository.dart';

class InsertNoteToLocal extends InsertToLocal<Note, LocalNoteRepository> {
  InsertNoteToLocal(super.repository);
}
