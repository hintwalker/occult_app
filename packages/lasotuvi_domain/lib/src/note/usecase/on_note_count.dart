import 'package:tauari_data_core/tauari_data_core.dart';

import '../repository/note_repository.dart';

class OnNoteCount extends OnCountEveryWhere<NoteRepository> {
  const OnNoteCount(super.repository);
}
