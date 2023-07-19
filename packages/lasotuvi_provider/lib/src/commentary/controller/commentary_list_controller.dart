import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_commentary/lasotuvi_commentary.dart';

import '../usecase/on_commentaries.dart';

final commentaryListControllerProvider =
    ChangeNotifierProvider.autoDispose<CommentaryListController>(
  (ref) => CommentaryListController(
      onSyncableData: ref.read(onCommentariesProvider)),
);
