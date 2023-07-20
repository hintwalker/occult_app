import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/commentary_and_request/commentary_and_request_repository.dart';

final onCommentaryAndRequestProvider =
    Provider.autoDispose<OnCommentaryAndRequest>(
  (ref) => OnCommentaryAndRequest(
      repository: ref.read(commentaryAndRequestRepositoryProvider)),
);
