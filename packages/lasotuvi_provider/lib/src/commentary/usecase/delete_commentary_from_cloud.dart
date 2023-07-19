import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/cloud_commentary_repository.dart';

final deleteCommentaryFromCloudProvider =
    Provider.autoDispose<DeleteCommentaryFromCloud>(
  (ref) =>
      DeleteCommentaryFromCloud(ref.read(cloudCommentaryRepositoryProvider)),
);
