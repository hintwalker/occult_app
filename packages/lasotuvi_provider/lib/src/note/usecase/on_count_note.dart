import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/note_cache_repostiory.dart';

final onCountNoteProvider = Provider(
  (ref) => OnCountNote(
    ref.read(noteCacheRepositoryProvider),
  ),
);
