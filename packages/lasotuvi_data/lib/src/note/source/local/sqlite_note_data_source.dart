import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/note_model.dart';

class SqliteNoteDataSource extends LocalDataSource<NoteModel> {
  SqliteNoteDataSource(super.dao)
      : super(fromMap: (map) => NoteModel.fromMap(map));
}
