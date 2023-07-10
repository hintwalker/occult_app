import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/note.dart';

abstract class NoteRepository extends SyncableRepository<Note> {
  NoteRepository(
      {required super.localRepository, required super.cloudRepository});
}
