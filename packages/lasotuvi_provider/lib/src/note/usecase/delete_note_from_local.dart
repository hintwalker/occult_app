import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/local_note_repository.dart';

final deleteNoteFromLocalProvider = Provider.autoDispose<DeleteNoteFromLocal>(
  (ref) => DeleteNoteFromLocal(ref.read(localNoteRepositoryProvider)),
);
