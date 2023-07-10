import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/note_repostiory.dart';

final onNotesProvider = Provider.autoDispose<OnNotes>(
  (ref) => OnNotes(ref.read(noteRepositoryProvider)),
);
