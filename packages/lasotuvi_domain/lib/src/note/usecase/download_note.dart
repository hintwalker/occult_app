import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/note.dart';
import '../repository/note_repository.dart';

class DownloadNote extends Download<Note, NoteRepository> {
  DownloadNote(super.repository);
}
