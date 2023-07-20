import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_commentary/lasotuvi_commentary.dart';

import '../usecase/on_commentary_and_request.dart';

final commentaryAndRequestListControllerProvider =
    ChangeNotifierProvider.autoDispose<CommentaryAndRequestListController>(
        (ref) => CommentaryAndRequestListController(
            onData: ref.read(onCommentaryAndRequestProvider)));
