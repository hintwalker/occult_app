import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../dao/note_dao.dart';

final sqliteNoteDataSourceProvider = Provider.autoDispose<SqliteNoteDataSource>(
  (ref) => SqliteNoteDataSource(ref.read(noteDaoProvider)),
);
