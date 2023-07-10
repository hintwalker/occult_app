import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/note_repostiory.dart';

final syncNotesProvider = Provider.autoDispose<SyncNotes>(
  (ref) => SyncNotes(ref.read(noteRepositoryProvider)),
);
