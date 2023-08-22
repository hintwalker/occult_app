import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/note.dart';
import '../repository/note_repository.dart';

class UploadNote extends Upload<Note, NoteRepository> {
  UploadNote({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
