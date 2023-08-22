import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/note.dart';
import '../repository/note_repository.dart';

class UpdateNote extends Update<Note, NoteRepository> {
  UpdateNote({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
