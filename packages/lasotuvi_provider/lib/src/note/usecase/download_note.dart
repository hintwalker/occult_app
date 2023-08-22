import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/note_cache_repostiory.dart';

final downloadNoteProvider = Provider.autoDispose<DownloadNote>(
  (ref) => DownloadNote(ref.read(noteCacheRepositoryProvider)),
);
