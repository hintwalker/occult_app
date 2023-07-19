import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_commentary/lasotuvi_commentary.dart';

import '../usecase/on_commentary_by_id.dart';

final commentaryReaderControllerProvider =
    ChangeNotifierProvider.autoDispose<CommentaryReaderController>(
  (ref) => CommentaryReaderController(
    onSyncableData: ref.read(onCommentaryByIdProvider),
  ),
);
