import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/note_repostiory.dart';

final uploadNoteProvider = Provider.autoDispose<UploadNote>(
  (ref) => UploadNote(ref.read(noteRepositoryProvider)),
);
