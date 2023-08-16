import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class TakeNoteById extends TakeById<Note, NoteRepository> {
  TakeNoteById(super.repository);
}
