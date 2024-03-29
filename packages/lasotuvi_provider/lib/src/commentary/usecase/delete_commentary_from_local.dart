import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/local_commentary_repository.dart';

final deleteCommentaryFromLocalProvider =
    Provider.autoDispose<DeleteCommentaryFromLocal>(
  (ref) =>
      DeleteCommentaryFromLocal(ref.read(localCommentaryRepositoryProvider)),
);
