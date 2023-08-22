import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/note.dart';
import '../repository/cloud_note_repository.dart';

class DeleteNoteFromCloud extends DeleteFromCloud<Note, CloudNoteRepository> {
  DeleteNoteFromCloud({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
