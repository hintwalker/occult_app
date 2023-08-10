import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/note_repostiory.dart';

final countNoteProvider = Provider(
  (ref) => CountNote(
    ref.read(
      noteRepositoryProvider,
    ),
  ),
);
