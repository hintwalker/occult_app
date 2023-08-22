import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/commentary_cache_repostiory.dart';

final syncCommentaryiesProvider = Provider.autoDispose<SyncCommentaries>(
  (ref) => SyncCommentaries(ref.read(commentaryCacheRepositoryProvider)),
);
